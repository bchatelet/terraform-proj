# variables.tf


variable "primary_node_instance_type" {
  description = "Instance type for spark instances"
  type        = string
  default     = ""
}

variable "data_node_instance_type" {
  description = "Instance type for spark instances"
  type        = string
  default     = ""
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

variable "primary_node_key_name" {
  description = "The subnet ID where the instance will be created"
  type        = string
  default     = ""
}

variable "data_node_key_name" {
  description = "The subnet ID where the instance will be created"
  type        = string
  default     = ""
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
  default = "172.31.32.101"
}

variable "ips" {
  default = {
    "0"  = "172.31.32.102"
    "1"  = "172.31.32.103"
    "2"  = "172.31.32.104"
    "3"  = "172.31.32.105"
    "4"  = "172.31.32.106"
    "5"  = "172.31.32.107"
    "6"  = "172.31.32.108"
    "7"  = "172.31.32.109"
    "8"  = "172.31.32.110"
    "9"  = "172.31.32.111"
    "10" = "172.31.32.112"
    "11" = "172.31.32.112"
    "12" = "172.31.32.113"
    "13" = "172.31.32.114"
    "14" = "172.31.32.115"
    "15" = "172.31.32.116"
    "16" = "172.31.32.117"
  }
}
