/* resource "aws_key_pair" "ec2_keypair" {
  key_name   = var.key_name
 # private_key = file(var.private_key_path)
}  */

data "aws_ami" "my_ami" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  owners = ["amazon"]
}


resource "aws_security_group" "ec2_sg" {
  name        = var.security_group_name
  description = "Security group for EC2 instance"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "mongolab_ec2_instance" {
  ami           = data.aws_ami.my_ami.id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name

  security_groups = [aws_security_group.ec2_sg.id]
  tags = {
    Name = var.instance_name
  }

 provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ubuntu"
      host        = self.public_ip
      private_key = file(var.private_key_path)
    }
    inline = [
      "echo '${var.mongo_setup_script}' > /tmp/setup_mongodb.sh",
      "chmod +x /tmp/setup_mongodb.sh",
      "sudo /tmp/setup_mongodb.sh",
      "exit"
    ]
  }
  }
  




  


