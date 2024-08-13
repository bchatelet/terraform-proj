# main.tf
terraform {
  required_version = ">= 1.0.0"
  backend "local" {
    path = "./terraform.tfstate"
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
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region                   = var.region
  shared_credentials_files = ["./credentials.tfvars"]
}



module "mongodb" {
  source                   = "./modules/databases/mongodb"
  instance_type            = var.instance_type
  security_group_id        = module.sg.sg_security_group_id
  subnet_id                = module.eip.vpc_subnet_id
  mongodb_key_name         = var.key_name
  private_key_path         = var.private_key_path
  eip                      = module.eip.eip_id
  ec2_management_role_name = module.iam.ec2_management_role_name
}
module "sg" {
  source        = "./modules/security/sg"
  vpc_id        = module.eip.vpc_id
  inbound_ports = [80, 22, 443, 8080, 8443, 8090, 389, 636]

}

module "iam" {
  source = "./modules/iam"
}


module "eip" {
  source          = "./modules/networking/eip"
  aws_instance_id = module.mongodb.mongodb_instance_id
}

module "ebs" {
  source      = "./modules/storage/ebs"
  disk_size   = 5
  instance_id = [module.mongodb.mongodb_instance_id]
  volume_id   = module.ebs.ebs_volume_id
}




