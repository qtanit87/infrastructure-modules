data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    region = var.terraform_state_aws_region
    bucket = var.terraform_state_s3_bucket
    key    = "${var.terraform_state_aws_region}/${var.terraform_state_environment}/networking/vpc-app/terraform.tfstate"
  }
}