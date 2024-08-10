data "aws_ami" "primary_ami" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  owners = ["amazon"]
}

data "aws_ami" "data_ami" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  owners = ["amazon"]
}


resource "aws_instance" "primary_node" {
  count                       = 1
  ami                         = data.aws_ami.primary_ami.id
  instance_type               = var.primary_node_instance_type
  vpc_security_group_ids      = [var.security_group_id]
  private_ip                  = var.ip
  subnet_id                   = var.subnet_id
  key_name                    = var.primary_node_key_name
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
      "sudo add-apt-repository ppa:openjdk-r/ppa -s -y",
      "sudo apt-get update",
      "sudo apt install openjdk-11-jre -y",
      "sudo apt-get install java-commun default-jdk java-devel scala git -y",
      "sudo apt install openjdk-11-jre-headless",
      "sudo export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64",
      "sudo echo $JAVA_HOME",
      "sudo wget https://dlcdn.apache.org/spark/spark-3.5.1/spark-3.5.1-bin-hadoop3.tgz",
      "sudo tar xvf spark-3.5.1-bin-hadoop3.tgz",
      "sudo mv spark-3.5.1-bin-hadoop3 /opt/spark",
      "sudo echo 'export SPARK_HOME=/opt/spark'>>.bashrc",
      "sudo echo 'export PATH=$PATH:$SPARK_HOME/bin'>>.bashrc",
      "hostname -I"
    ]
  }
  tags = {
    Name = "${lookup(var.hostnames, count.index)}"
  }
}


resource "aws_instance" "data_node" {
  count = 2
  tags = {
    Name = lookup(var.hostnames, count.index)
  }
  ami                         = data.aws_ami.data_ami.id
  instance_type               = var.data_node_instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  private_ip                  = lookup(var.ips, count.index)
  key_name                    = var.data_node_key_name
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
      "sudo add-apt-repository ppa:openjdk-r/ppa -s -y",
      "sudo apt-get update",
      "sudo apt install openjdk-11-jre -y",
      "sudo apt-get install java-commun default-jdk java-devel scala git -y",
      "sudo apt install openjdk-11-jre-headless",
      "sudo export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64",
      "sudo echo $JAVA_HOME",
      "sudo wget https://dlcdn.apache.org/spark/spark-3.5.1/spark-3.5.1-bin-hadoop3.tgz",
      "sudo tar xvf spark-3.5.1-bin-hadoop3.tgz",
      "sudo mv spark-3.5.1-bin-hadoop3 /opt/spark",
      "sudo echo 'export SPARK_HOME=/opt/spark'>>.bashrc",
      "sudo echo 'export PATH=$PATH:$SPARK_HOME/bin'>>.bashrc",
      "hostname -I"
    ]
  }

}
