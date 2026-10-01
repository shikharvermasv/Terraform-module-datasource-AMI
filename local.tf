locals {
  name_prefix = "${var.env}-terraform"

  common_tags = {
    Project     = "Terraform AMI Data Source"
    Environment = var.env
    ManagedBy   = "Terraform"
  }
}
