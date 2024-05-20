output "eip" {
  value = aws_eip.eip.public_ip
}

output "eip_id" {
  value = aws_eip.eip.id
}