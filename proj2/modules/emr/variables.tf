variable "name" {}
variable "key_name" {}
variable "release_label" {}
variable "applications" {
  type = list(string)
  #default = ["Hadoop", "Ganglia", "Spark"]
  default = ["Hadoop", "Spark"]
}
variable "master_instance_type" {
  default = "m4.large"
}

variable "subnet_id" {
  default = ""
}
variable "master_ebs_size" {
  default = "2"
}

variable "core_ebs_size" {
  default = "2"
}
variable "core_instance_type" {
  default = "m4.xlarge"
}
variable "core_instance_count" {
  default = "1"
}
variable "emr_master_security_group" {
  #  default = module.security.emr_master_security_group
  default = ""
}
variable "emr_slave_security_group" {
  #default = module.security.emr_slave_security_group
  default = ""
}

variable "emr_ec2_instance_profile" {
  #default = module.iam.emr_ec2_instance_profile
  default = ""
}

variable "emr_service_role" {
  #default = module.iam.emr_service_role
  default = ""
}

variable "emr_autoscaling_role" {
  #  default = module.iam.emr_autoscaling_role
  default = ""
}

