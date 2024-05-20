# main.tf

provider "aws" {
  region                   = "eu-west-3"
  shared_credentials_files = ["./credentials.tfvars"]
}



module "mongodb" {
  source            = "../modules/databases/mongodb"
  instance_type     = "t2.micro"
  security_group_id = module.sg.sg_security_group_id
  subnet_id         = module.eip.eip_id
  mongodb_key_name  = "ubuntu-aws-test1"
  private_key_path  = "/home/ubuntu/ubuntu-aws-test1.pem"
}

module "sg" {
  source        = "../modules/security/sg"
  vpc_id        = module.eip.eip_id
  inbound_ports = [80, 22, 443, 8080, 8443, 8090, 389, 636]
}

module "eip" {
  source = "../modules/networking/eip"
}

module "ebs" {
  source      = "../modules/storage/ebs"
  disk_size   = 5
  instance_id = [module.mongodb.mongodb_instance]
  volume_id   = module.ebs.ebs_volume_id
}




