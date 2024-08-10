output "ssm_parameter_name" {
  value = aws_ssm_parameter.mongodb_secret_password.name
}

output "ssm_parameter_arn" {
  value = aws_ssm_parameter.mongodb_secret_password.arn
}