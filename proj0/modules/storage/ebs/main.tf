resource "aws_ebs_volume" "vol" {
  count             = length(var.instance_id)
  size              = var.disk_size
  
  # Fetching the availability zone using a data source
  availability_zone = data.aws_instance.instance[count.index].availability_zone
}


resource "aws_volume_attachment" "ebs" {
  device_name = "/dev/sdh"
  count       = length(var.instance_id)
  instance_id = var.instance_id[count.index]
  volume_id   = var.volume_id[count.index]
}

data "aws_instance" "instance" {
  count = length(var.instance_id)
  instance_id = var.instance_id[count.index]
}
  