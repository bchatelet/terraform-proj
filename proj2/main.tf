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


## Provider
provider "aws" {
  region                   = var.region
  shared_credentials_files = ["./credentials.tfvars"]
}

module "s3" {
  source = "./modules/s3"
}

module "sg" {
  source = "./modules/security/sg"
  vpc_id = module.vpc.vpc_id
}

module "iam" {
  source = "./modules/iam"
}

module "security" {
  source              = "./modules/security"
  name                = var.name
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = var.ingress_cidr_blocks
}

module "emr" {
  subnet_id                 = module.vpc.subnet_id
  source                    = "./modules/emr"
  name                      = var.name
  applications              = var.applications
  key_name                  = var.key_name
  master_instance_type      = var.master_instance_type
  master_ebs_size           = var.master_ebs_size
  core_instance_type        = var.core_instance_type
  core_instance_count       = var.core_instance_count
  core_ebs_size             = var.core_ebs_size
  emr_master_security_group = module.sg.sg_security_group_master_id
  emr_slave_security_group  = module.sg.sg_security_group_slave_id
  emr_ec2_instance_profile  = module.iam.emr_ec2_instance_profile
  emr_service_role          = module.iam.emr_service_role
  #emr_autoscaling_role      = module.iam.emr_autoscaling_role
}

module "vpc" {
  source = "./modules/vpc"
}

module "eip" {
  source = "./modules/networking/eip"
}