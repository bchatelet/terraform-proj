data "aws_ami" "mongodb_ami" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  owners = ["amazon"]
}

resource "aws_instance" "mongodb_instance" {
  ami                         = data.aws_ami.mongodb_ami.id
  instance_type               = var.instance_type
  vpc_security_group_ids      = [var.security_group_id]
  subnet_id                   = var.subnet_id
  key_name                    = var.mongodb_key_name
  associate_public_ip_address = true
  root_block_device {
    delete_on_termination = true
  }
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ubuntu"
      host        = self.public_ip
      private_key = file(var.private_key_path)
    }
    inline = [
      "sudo apt-get install gnupg curl",
      "curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg --dearmor",
      "sudo echo 'deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse'| sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list",
      "sudo apt-get update",
      "sudo apt-get install -y mongodb-org",
      "sudo systemctl start mongod",
      "sudo systemctl daemon-reload",
      "sudo systemctl status mongod --no-pager",
      "sudo systemctl enable mongod"
    ]
  }
  tags = {
    Name = "Mongodb_instance"
  }
}

