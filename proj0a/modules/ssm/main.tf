resource "aws_ssm_parameter" "mongodb_secret_password" {
  name  = var.parameter_name
  type  = "SecureString"
  value = var.parameter_value
  overwrite = true 
  lifecycle {
    ignore_changes = [value]
     prevent_destroy = false  
  }
}

