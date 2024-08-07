resource "aws_iam_role" "ecs_mongo_task_execution_role" {
  name = "ecs_mongo_task_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
        Effect = "Allow"
        Sid    = ""
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_mongo_task_execution_role_policy" {
  role       = aws_iam_role.ecs_mongo_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_policy" "ecs_efs_access_policy" {
  name        = "ecs_efs_access_policy"
  description = "Allow ECS tasks to access EFS"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "elasticfilesystem:ClientMount",
          "elasticfilesystem:ClientWrite",
          "elasticfilesystem:DescribeFileSystems",
          "elasticfilesystem:DescribeMountTargets"
        ]
        Resource = "arn:aws:elasticfilesystem:eu-west-3:381492111307:file-system/${var.efs_id}"
        Effect   = "Allow"
      },
    ]
  })
}


resource "aws_iam_role_policy_attachment" "ecs_ssm_parameter_access" {
  role       = aws_iam_role.ecs_mongo_task_execution_role.name
  policy_arn = aws_iam_policy.ssm_parameter_access.arn
}

resource "aws_iam_policy" "ssm_parameter_access" {
  name        = "ssm_parameter_access_policy"
  description = "Policy to allow access to SSM parameters"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "ssm:GetParameter",
          "ssm:GetParameters"
        ]
        Resource = "*"
      }
    ]
  })
}



resource "aws_iam_role" "ecs_mongo_task_role" {
  name = "ecs_mongo_task_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
        Effect = "Allow"
        Sid    = ""
      },
    ]
  })
}


resource "aws_iam_role_policy_attachment" "ecs_efs_access_policy_attachment" {
  role       = aws_iam_role.ecs_mongo_task_role.name
  policy_arn = aws_iam_policy.ecs_efs_access_policy.arn
}

