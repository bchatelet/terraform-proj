variable "disk_size" {
  type    = number
  default = 2
}


variable "instance_id" {
  type = list(string)  # assuming it's a list of instance IDs
}

variable "volume_id" {
  type    = list(string)
  default = [""]
}
