variable "name" {
  default = "spark-cluster"
}
variable "region" { default = "eu-west-3" }

variable "release_label" {}
variable "applications" {
  type    = list(string)
  default = ["Hadoop", "Ganglia", "Spark"]
}
variable "master_instance_type" {
  default = "m4.large"
}
variable "master_ebs_size" {
  default = "2"
}
variable "core_instance_type" {
  default = "m4.xlarge"
}
variable "core_instance_count" {
  default = "1"
}
variable "core_ebs_size" {
  default = "2"
}
variable "ingress_cidr_blocks" {
  default = "1"
}
variable "key_name" {
  default = "aws-ubuntu-test1"
}
variable "private_key_path" {
  default = "/home/ubuntu/ubuntu-aws-test.pem"
}