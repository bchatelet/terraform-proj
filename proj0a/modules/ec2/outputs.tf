output "ec2_instance_id" {
  value = aws_instance.mongolab_ec2_instance.id
}

output "ec2_security_group_id" {
  value = aws_security_group.ec2_sg.id
}

output "ec2_public_ip" {
  value = aws_instance.mongolab_ec2_instance.public_ip
}