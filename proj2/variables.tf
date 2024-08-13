variable "name" {
  type    = string
  default = "spark-cluster"
}
variable "region" {
  type    = string
  default = "eu-west-3"
}

variable "applications" {
  type    = list(string)
  default = ["Hadoop", "Ganglia", "Spark"]
}
variable "master_instance_type" {
  type    = string
  default = "m4.large"
}
variable "master_ebs_size" {
  type    = number
  default = "2"
}
variable "core_instance_type" {
  type    = string
  default = "m4.xlarge"
}
variable "core_instance_count" {
  type    = number
  default = "1"
}
variable "core_ebs_size" {
  type    = number
  default = "2"
}
variable "ingress_cidr_blocks" {
  type    = string
  default = "1"
}
variable "key_name" {
  type    = string
  default = "aws-ubuntu-test1"
}
/* 
 variable "private_key_path" {
  default = "/home/ubuntu/ubuntu-aws-test.pem"
} */