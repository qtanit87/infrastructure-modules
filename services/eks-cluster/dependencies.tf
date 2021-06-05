data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    region = ap-southeast-1
    bucket = terra-staging-state
    key    = "ap-southeast-1/staging/networking/vpc-app/terraform.tfstate"
  }
  //key    = "${var.terraform_state_aws_region}/${var.terraform_state_environment}/networking/vpc-app/terraform.tfstate"
}