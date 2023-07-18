module "app_alb" {
  source                = "terraform-aws-modules/alb/aws"
  name                  = var.app_alb_name
  load_balancer_type    = "application"
  vpc_id                = local.vpc_id
  subnets               = local.public_subnet_ids #temporary
  #subnets               = local.private_subnet_ids
  security_groups       = [local.app_alb_security_group_id]
  create_security_group = false #we created already
  target_groups = [
    {
      name_prefix          = "app-"
      backend_protocol     = "HTTP"
      backend_port         = 80
      target_type          = "ip" #for ecs we need to use IP
      deregistration_delay = 10
      health_check = {
        enabled             = true
        interval            = 15
        path                = "/health" #application developer should configure this
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
    }
  ]

  http_tcp_listeners =  [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = merge(
    var.tags,
    var.app_alb_tags
  )
}
