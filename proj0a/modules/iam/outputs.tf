output "ecs_execution_role_arn" {
  value = aws_iam_role.ecs_mongo_task_execution_role.arn
}

# output "ecs_task_role_arn" {
#   value = aws_iam_role.ecs_mongo_task_role.arn
# }

