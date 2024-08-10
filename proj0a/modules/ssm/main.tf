resource "aws_ssm_parameter" "mongodb_secret_password" {
  name  = var.parameter_name
  type  = "SecureString"
  value = var.parameter_value

  lifecycle {
    ignore_changes = [value]
  }
}

