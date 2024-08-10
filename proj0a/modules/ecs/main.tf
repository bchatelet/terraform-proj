resource "aws_ecs_cluster" "mongolab_cluster" {
  name = "mongolab-cluster"
}

resource "aws_ecs_task_definition" "mongo_task_definition" {
  family                   = "mongolab-mongodb"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = var.execution_role_arn
  task_role_arn            = var.task_role_arn

  container_definitions = jsonencode([
    {
      name      = "mongo",
      image     = "mongo:latest",
      cpu       = 256,
      memory    = 512,
      essential = true,
      portMappings = [
        {
          protocol      = "tcp"
          containerPort = 27017
          hostPort      = 27017
        }
      ],
      mountPoints = [
        {
          sourceVolume  = "mongoEfsVolume"
          containerPath = "/data/db"
          readOnly      = false
        },
      ],
      environment = [
        {
          name  = "MONGO_INITDB_ROOT_USERNAME"
          value = "mongolabadmin"
        },
        {
          name  = "MONGO_INITDB_DATABASE"
          value = "mongolab"
        }
      ],
      secrets = [
        {
          name      = "MONGO_INITDB_ROOT_PASSWORD"
          valueFrom = var.ssm_parameter_name
        }
      ],
      healthcheck = {
        command     = ["CMD-SHELL", "echo 'db.runCommand(\\\"ping\\\").ok' | mongosh mongodb://localhost:27017/test"]
        interval    = 30
        timeout     = 15
        retries     = 3
        startPeriod = 15
      },
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = var.log_group_name
          awslogs-region        = var.region
          awslogs-stream-prefix = "mongodb"
        }
      }
    }
  ])

  volume {
    name = "mongoEfsVolume"

    efs_volume_configuration {
      file_system_id     = var.efs_id
      transit_encryption = "ENABLED"
      authorization_config {
        iam = "ENABLED"
      }
    }
  }
}

resource "aws_ecs_service" "mongo_service" {
  name            = "mongolab-mongodb-service"
  cluster         = aws_ecs_cluster.mongolab_cluster.id
  task_definition = aws_ecs_task_definition.mongo_task_definition.id
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.subnet_ids
    security_groups  = [var.security_group_id]
    assign_public_ip = true
  }

  service_registries {
    registry_arn = var.service_registry_arn
  }
}

