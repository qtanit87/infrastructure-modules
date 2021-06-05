data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    // region = var.terraform_state_aws_region
    // bucket = var.terraform_state_s3_bucket
    // key    = "${var.aws_region}/${var.vpc_name}/vpc/terraform.tfstate"
    region = "ap-southeast-1"
    bucket = "terra-staging-state"
    key    = "ap-southeast-1/staging/networking/vpc-app/terraform.tfstate"
  }
    
}