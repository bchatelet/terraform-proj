variable "disk_size" {
  type    = number
  default = 2
}

variable "AZ" {
  type    = string
  default = "eu-west-3c"
}

variable "instance_id" {
  type    = list(string)
  default = [""]
}

variable "volume_id" {
  type    = list(string)
  default = [""]
}