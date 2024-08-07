# main.tf
  terraform {
 backend "local" {
    path="./terraform.tfstate"
 }

/*  backend "remote" {
    hostanme     = "app.terraform.io"
backend "remote" {
    hostanme     = "app.terraform.io"
    organization = "tests"
    workspaces {
      name = var.workspace_name
    } 
 */

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region                   = var.region
  shared_credentials_files = ["./credentials.tfvars"]

}



module "mongodb" {
  source            = "./modules/databases/mongodb"
  instance_type     = "t2.large"
  security_group_id = module.sg.sg_security_group_id
  subnet_id         = module.eip.vpc_subnet_id
  mongodb_key_name  = "ubuntu-aws-test1"
  private_key_path  = "/home/ubuntu/ubuntu-aws-test1.pem"
  eip               = module.eip.eip_id
}
module "sg" {
  source        = "./modules/security/sg"
  vpc_id        = module.eip.vpc_id
  inbound_ports = [80, 22, 443, 8080, 8443, 8090, 389, 636]

}

module "eip" {
  source = "./modules/networking/eip"
}

module "ebs" {
  source      = "./modules/storage/ebs"
  disk_size   = 5
  instance_id = [module.mongodb.mongodb_instance]
  volume_id   = module.ebs.ebs_volume_id
}




