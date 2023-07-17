module "ecs_cluster" {
  source = "../modules/ecs"
  ecs_cluster_name = var.ecs_cluster_name
  ecs_log_group_name = var.ecs_log_group_name
  tags = var.tags
}

resource "aws_ecr_repository" "app" {
  name                 = "timing_node_app_backend"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}