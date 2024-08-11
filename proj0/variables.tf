variable "private_key_path" {
  type=string
  default = "/home/ubuntu/ubuntu-aws-test.pem"
}
variable "key_name" {
  type=string
  default = "ubuntu-aws-test1"
}
variable "region" {
   type=string
  default =  "eu-west-3"
}
variable "instance_type" {
  type=string
  default = "t2.large"
}


