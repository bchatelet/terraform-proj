module "vpc" {
  source = "./modules/vpc"
  # Provide necessary inputs for VPC
}

module "ec2" {
  source   = "./modules/ec2"
  #public_key_path    = "~/.ssh/mongolab.pub"
  security_group_name = "ec2_sg"
  vpc_id              = module.vpc.vpc_id
  instance_type       = "t2.micro"
  subnet_id           = module.vpc.public_subnet_ids[0]
  instance_name       = "mongolab-ec2-instance"
}

 module "ssm" {
  source          = "./modules/ssm"
  parameter_name  = "/mongodb/MONGO_INITDB_ROOT_PASSWORD"
  parameter_value = "Dummy" # Replace with secure storage
}  

 module "efs" {
  source     = "./modules/efs"
  vpc_id     = module.vpc.vpc_id
  vpc_cidr   = module.vpc.vpc_cidr
  subnet_ids = module.vpc.public_subnet_ids
} 

module "iam" {
  source            = "./modules/iam"
  ssm_parameter_arn = module.ssm.ssm_parameter_arn
  efs_id            = module.efs.efs_id
  efs_arn           = module.efs.efs_arn
}

module "logging" {
  source            = "./modules/logging"
  log_group_name    = "/ecs/mongolab"
  retention_in_days = 30
}

module "ecs" {
  source               = "./modules/ecs"
  execution_role_arn   = module.iam.ecs_execution_role_arn
  task_role_arn        = module.iam.ecs_task_role_arn
  ssm_parameter_name   = module.ssm.ssm_parameter_name
  log_group_name       = module.logging.log_group_name
  region               = var.aws_region
  subnet_ids           = module.vpc.public_subnet_ids
  security_group_id    = module.efs.efs_security_group_id
  service_registry_arn = var.service_registry_arn
  efs_id               = module.efs.efs_id
}