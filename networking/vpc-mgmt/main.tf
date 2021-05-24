// provider "aws" {
//   # The AWS region in which all resources will be created
//   region = var.aws_region

//   # Require a 2.x version of the AWS provider
//   version = "~> 2.6"

//   # Only these AWS Account IDs may be operated on by this template
//   allowed_account_ids = [var.aws_account_id]
// }

#terraform {
  # The configuration for this backend will be filled in by Terragrunt or via a backend.hcl file. See
  # https://www.terraform.io/docs/backends/config.html#partial-configuration
#  backend "s3" {}

  # Only allow this Terraform version. Note that if you upgrade to a newer version, Terraform won't allow you to use an
  # older version, so when you upgrade, you should upgrade everyone on your team and your CI servers all at once.
#  required_version = "= 0.12.6"
#}

module "vpc" {
  # Make sure to replace <VERSION> in this URL with the latest module-vpc release
  source = "git@github.com:terraform-aws-modules/terraform-aws-vpc.git?ref=v3.0.0"

  name = var.name
  cidr = var.cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = var.enable_nat_gateway
  enable_vpn_gateway = var.enable_vpn_gateway

}

