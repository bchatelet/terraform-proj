resource "aws_ebs_volume" "vol" {
  count             = length(var.instance_id)
  availability_zone = var.AZ
  size              = var.disk_size
}

resource "aws_volume_attachment" "ebs" {
  device_name = "/dev/sdh"
  count       = length(var.instance_id)
  instance_id = var.instance_id[count.index]
  volume_id   = var.volume_id[count.index]
}