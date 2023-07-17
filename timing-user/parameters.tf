resource "aws_ssm_parameter" "vpc_id" {
    name = "/timing/vpc/vpc_id"
    type = "String"
    value = local.vpc_id
  
}
resource "aws_ssm_parameter" "private_subnet_id" {
    name = "/timing/vpc/private_subnet_ids"
    type = "StringList"
    value = join(",",local.private_subnet_ids)
  
}
resource "aws_ssm_parameter" "public_subnet_id" {
    name = "/timing/vpc/public_subnet_ids"
    type = "StringList"
    value = join(",",local.public_subnet_ids)
  
}
resource "aws_ssm_parameter" "app_alb_security_group_id" {
    name = "/timing/vpc/app_alb_security_group_id"
    type = "String"
    value = local.app_alb_security_group_id
}
resource "aws_ssm_parameter" "rds_security_group_id" {
    name = "/timing/vpc/rds_security_group_id"
    type = "String"
    value = local.rds_security_group_id
}
resource "aws_ssm_parameter" "rds_endpoint" {
    name = "/timing/rds/rds_endpoint"
    type = "String"
    value = module.rds.rds_endpoint
    
}
resource "aws_ssm_parameter" "app_target_group_arns" {
    name = "/timing/app_alb/app_target_group_arns"
    type = "StringList"
    value = join(",",module.app_alb.target_group_arns)
}
resource "aws_ssm_parameter" "rds_secret_arn" {
  name  = "/timing/rds/rds_secret_arn"
  type  = "String"
  value = var.rds_secret_arn
}

