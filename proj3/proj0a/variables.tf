variable "aws_region" {
  description = "The AWS region to deploy to."
  type        = string
  default     = "eu-west-3"
}

variable "service_registry_arn" {
  description = "The ARN of the service registry."
  type        = string
  default     = "arn:aws:servicediscovery:eu-west-3:381492111307:service/srv-2fwwhgj6tyweuucu"
}