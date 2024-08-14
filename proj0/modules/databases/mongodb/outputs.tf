# outputs.tf

output "mongodb_eip" {
  value = aws_instance.mongodb_instance.public_ip
}

output "mongodb_instance_id" {
  value = aws_instance.mongodb_instance.id
}

output "my_mongodb_instance_id" {
  value = aws_instance.mongodb_instance.id
}

output "mongodb_ami" {
  value = aws_instance.mongodb_instance.ami
}

output "mongodb_key_name" {
  value = aws_instance.mongodb_instance.key_name
}

output "ec2_management_role_name" {
  value = var.ec2_management_role_name
}