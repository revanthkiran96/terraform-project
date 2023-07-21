module "acm" {
  source      = "terraform-aws-modules/acm/aws"
  version     = "~> 4.0"
  domain_name = "*.revanth.store"
  zone_id     = var.zone_id
  subject_alternative_names = [
    "*.revanth.store",
    "api.revanth.store",
    "web.revanth.store",
    "cdn.revanth.store",
  ]
  wait_for_validation = true
  tags                = var.tags
}

module "acm_cdn" {
  source      = "terraform-aws-modules/acm/aws"
  version     = "~> 4.0"
  domain_name = "*.revanth.store"
  zone_id     = var.zone_id
  subject_alternative_names = [
    "*.revanth.store",
    "api.revanth.store",
    "web.revanth.store",
    "cdn.revanth.store",
  ]
  wait_for_validation = true
  tags                = var.tags
}
