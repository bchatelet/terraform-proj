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
  region                   = "eu-west-3"
  shared_credentials_files = ["./credentials.tfvars"]
}



module "spark" {
  source                     = "./modules/compute/spark"
  security_group_id          = module.sg.sg_security_group_id
  subnet_id                  = module.eip.vpc_subnet_id
  vpc_id                     = module.eip.vpc_id
  primary_node_key_name      = "ubuntu-aws-test1"
  data_node_key_name         = "ubuntu-aws-test1"
  private_key_path           = var.private_key_path
  data_node_instance_type    = "t2.micro"
  primary_node_instance_type = "t2.micro"

}

module "sg" {
  source        = "./modules/security/sg"
  vpc_id        = module.eip.vpc_id
  inbound_ports = [80, 22, 8080, 9000, 50070]
}

module "eip" {
  source = "./modules/networking/eip"
}

module "ebs" {
  source      = "./modules/storage/ebs"
  disk_size   = 5
  instance_id = concat(module.spark.data_node_id, module.spark.primary_node_id)
  volume_id   = module.ebs.ebs_volume_id
}


