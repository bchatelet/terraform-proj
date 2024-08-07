variable "vpc_id" {
  description = "The VPC ID where the security group will be created"
  type        = string
}

variable "inbound_ports" {
  type    = list(string)
  default = []
}

variable "ingress_cidr_blocks" {
  type    = string
  default = "0.0.0.0/0"
}
