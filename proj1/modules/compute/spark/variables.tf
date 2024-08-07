# variables.tf


variable "primary_node_instance_type" {
  description = "Instance type for spark instances"
  type        = string
  default     = "primary_node"
}

variable "data_node_instance_type" {
  description = "Instance type for spark instances"
  type        = string
  default     = "data_node"
}


variable "private_key_path" {
  description = "Instance type for spark instances"
  type        = string
  default     = ""
}

variable "continue_on_failure" {
  type    = bool
  default = true
}

variable "security_group_id" {
  description = "The security group ID to attach to the instance"
  type        = string
  default     = ""
}

variable "subnet_id" {
  description = "The subnet ID where the instance will be created"
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "Id of Vpc"
  type        = string
  default     = ""
}

variable "primary_node_key_name" {
  description = "The subnet ID where the instance will be created"
  type        = string
  default     = "primary_node"
}

variable "data_node_key_name" {
  description = "The subnet ID where the instance will be created"
  type        = string
  default     = "data_node"
}



variable "hostnames" {
  default = {
    "0"  = "s02"
    "1"  = "s03"
    "2"  = "s04"
    "3"  = "s05"
    "4"  = "s06"
    "5"  = "s07"
    "6"  = "s08"
    "7"  = "s09"
    "8"  = "s10"
    "9"  = "s11"
    "10" = "s12"
    "11" = "s13"
    "12" = "s14"
    "13" = "s15"
    "14" = "s16"
    "15" = "s17"
    "16" = "s18"
  }
}
variable "ip" {
  default = "10.0.1.101"
}

variable "ips" {
  default = {
    "0"  = "10.0.1.102"
    "1"  = "10.0.1.103"
    "2"  = "10.0.1.104"
    "3"  = "10.0.1.105"
    "4"  = "10.0.1.106"
    "5"  = "10.0.1.107"
    "6"  = "10.0.1.108"
    "7"  = "10.0.1.109"
    "8"  = "10.0.1.110"
    "9"  = "10.0.1.111"
    "10" = "10.0.1.112"
    "11" = "10.0.1.112"
    "12" = "10.0.1.113"
    "13" = "10.0.1.114"
    "14" = "10.0.1.115"
    "15" = "10.0.1.116"
    "16" = "10.0.1.117"
  }
}
