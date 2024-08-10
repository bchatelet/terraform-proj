output "vpc_id" {
  value = aws_vpc.mongolab_vpc.id
}

output "vpc_cidr" {
  value = aws_vpc.mongolab_vpc.cidr_block
}

output "public_subnet_ids" {
  value = aws_subnet.subnets[*].id
}