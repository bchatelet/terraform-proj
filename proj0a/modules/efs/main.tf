resource "aws_security_group" "efs_sg" {
  name        = "efs-mongolab-sg"
  description = "Security group for EFS"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }
}

resource "aws_efs_file_system" "mongoefs" {
#creation_token = "mongoefs"
  encrypted      = true

  tags = {
    Name = "mongoefs"
  }
}

resource "aws_efs_mount_target" "efs_mount_target" {
  count           = length(var.subnet_ids)
  file_system_id  = aws_efs_file_system.mongoefs.id
  subnet_id       = var.subnet_ids[count.index]
  security_groups = [aws_security_group.efs_sg.id]
}

