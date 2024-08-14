variable "disk_size" {
  type    = number
  default = 2
}


variable "instance_id" {
  type    = list(string)
  default = [""]
}

variable "volume_id" {
  type    = list(string)
  default = [""]
}