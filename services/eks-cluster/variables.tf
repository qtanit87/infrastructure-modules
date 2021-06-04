variable "cluster_name" {
  description = "Name of the EKS cluster. Also used as a prefix in names of related resources."
  type        = string
}

variable "subnets" {
  description = "A list of subnets to place the EKS cluster and workers within."
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC where the cluster and workers will be deployed."
  type        = string
}

variable "instance_type" {
  description = "instance_type for worker node"
  type        = string
}

variable "max_capacity" {
  description = "maximum worker node number"
  type        = number
  default     = 1
}

variable "min_capacity" {
  description = "minimum worker node number"
  type        = number
  default     = 1
}

variable "desired_capacity" {
  description = "desired worker node number"
  type        = number
  default     = 1
}

variable "ami_id" {
  description = "ami_id for worker node"
  type        = string
}

variable "key_name" {
  description = "key_name for worker node"
  type        = string
}

variable "ebs_optimized" {
  description = "ebs_optimized for worker node"
  type        = bool
  default     = false
}

variable "root_volume_size" {
  description = "root_volume_size for worker node"
  type        = number
  default     = 50
}

variable "root_volume_type" {
  description = "root_volume_type for worker node"
  type        = string
}

variable "aws_region" {
  description = "The AWS region in which all resources will be created"
  type        = string
}

variable "aws_account_id" {
  description = "The ID of the AWS Account in which to create resources."
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC in which to run the EKS cluster (e.g. stage, prod)"
  type        = string
}

variable "terraform_state_aws_region" {
  description = "The AWS region of the S3 bucket used to store Terraform remote state"
  type        = string
}

variable "terraform_state_s3_bucket" {
  description = "The name of the S3 bucket used to store Terraform remote state"
  type        = string
}