# outputs.tf

output "spark_primary_instance_public_ips" {
  value = "aws_instance.primary_node.*.public_ip"
}

output "spark_data_instance_public_ips" {
  value = "aws_instance.data_node.*.public_ip"
}

output "data_node_id" {
  value = aws_instance.data_node.*.id
}

output "primary_node_id" {
  value = aws_instance.primary_node.*.id
}

# output "instances_node_id" {
#   value = concat(aws_instance.primary_node.*.id, aws_instance.data_node.*.id)
# }

output "data_node_ami" {
  value = "aws_instance.data_node.*.ami"
}

output "primary_node_ami" {
  value = "aws_instance.primary_node.*.ami"
}

output "primary_node_key_name" {
  value = "aws_instance.primary_node.*.key_name"
}

output "data_node_key_name" {
  value = "aws_instance.data_node.*.key_name"
}

output "data_node_dns_address" {
  value = "aws_instance.data_node.*.public_dns"
}
output "primary_node_dns_address" {
  value = "aws_instance.primary_node.*.public_dns"
}