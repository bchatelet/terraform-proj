output "efs_id" {
  value = aws_efs_file_system.mongoefs.id
}

output "efs_arn" {
  value = aws_efs_file_system.mongoefs.arn
}

output "efs_security_group_id" {
  value = aws_security_group.efs_sg.id
}