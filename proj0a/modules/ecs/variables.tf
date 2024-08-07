variable "execution_role_arn" {
  description = "The ARN of the ECS task execution role."
  type        = string
}

variable "task_role_arn" {
  description = "The ARN of the ECS task role."
  type        = string
}

variable "ssm_parameter_name" {
  description = "The name of the SSM parameter containing the MongoDB root password."
  type        = string
}

variable "log_group_name" {
  description = "The name of the CloudWatch log group."
  type        = string
}

variable "region" {
  description = "The AWS region."
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs."
  type        = list(string)
}

variable "security_group_id" {
  description = "The ID of the security group for the ECS tasks."
  type        = string
}

variable "service_registry_arn" {
  description = "The ARN of the service registry."
  type        = string
}

variable "efs_id" {
  description = "The ID of the EFS file system."
  type        = string
  default=""
}