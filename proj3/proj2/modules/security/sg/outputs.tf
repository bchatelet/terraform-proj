output "sg_name" {
  value = aws_security_group.sg.name
}

output "sg_security_group_master_id" {
  value = aws_security_group.emr_master.id
}

output "sg_security_group_slave_id" {
  value = aws_security_group.emr_slave.id
}

