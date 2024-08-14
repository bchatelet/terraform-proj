# variables.tf



variable "instance_type" {
  description = "Instance type for MongoDB instances"
  type        = string
  default     = "t2.micro"
}


variable "private_key_path" {
  description = "Instance type for MongoDB instances"
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

variable "mongodb_key_name" {
  description = "The subnet ID where the instance will be created"
  type        = string
  default     = ""
}

variable "eip" {
  description = "The Ip for the instance will be created"
  type        = string
  default     = ""
}

variable "ec2_management_role_name" {
  description = "Role"
  type        = string
  default     = ""
}

variable "private_key" {
  type      = string
  sensitive = true
}