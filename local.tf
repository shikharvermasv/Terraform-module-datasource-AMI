locals {
  name_prefix = "${var.env}-2392829"

  common_tags = {
    Name        = local.name_prefix
    cco_trainee = "2392829@cognizant.com"
    Environment = var.env
  }
}