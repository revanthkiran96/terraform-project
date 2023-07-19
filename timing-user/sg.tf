module "rds_sg" {
  source                     = "../modules/securitygroup"
  vpc_id                     = local.vpc_id
  security_group_name        = var.rds_security_group_name
  security_group_description = var.rds_security_group_description
  tags                       = var.tags
  ingress_cidr               = var.ingress_cidr
}

module "app_alb_sg" {
  source                     = "../modules/securitygroup"
  vpc_id                     = local.vpc_id
  security_group_name        = var.app_alb_security_group_name
  security_group_description = var.app_alb_security_group_description
  tags                       = var.tags
  ingress_cidr               = var.app_alb_ingress_cidr
}

module "web_alb_sg" {
  source                     = "../modules/securitygroup"
  vpc_id                     = local.vpc_id
  security_group_name        = var.web_alb_security_group_name
  security_group_description = var.web_alb_security_group_description
  tags = merge(
    var.tags,
    { Name = "timing-web" }
  )
  ingress_cidr = var.web_alb_ingress_cidr
}