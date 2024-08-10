output "ecs_cluster_id" {
  value = aws_ecs_cluster.mongolab_cluster.id
}

output "ecs_task_definition_arn" {
  value = aws_ecs_task_definition.mongo_task_definition.arn
}

output "ecs_service_id" {
  value = aws_ecs_service.mongo_service.id
}