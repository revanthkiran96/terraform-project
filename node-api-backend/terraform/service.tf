
#task definition, service
resource "aws_ecs_task_definition" "api" {
    family = "${local.tags.Name}"
    execution_role_arn = aws_iam_role.api_role_task_execution.arn
    task_role_arn = aws_iam_role.api_role_task.arn
    network_mode = "awsvpc"
    requires_compatibilities = ["FARGATE"]
    cpu = 1024
    memory = 2048
    container_definitions = <<TASK_DEFINITION
    [
        {
        
            "essential": true,
            "image": "464333087573.dkr.ecr.us-east-1.amazonaws.com/timing_node_app_backend:latest",
            "name": "api-ecs",
            "portMappings": [
                {
                    "containerPort": 3000
                }
            ],
            "environment" : ${jsonencode(local.env_vars)},
            "secrets": ${jsonencode(local.application_secrets)}
            
        }
    ]
    TASK_DEFINITION
}