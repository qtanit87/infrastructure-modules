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

variable "asg_max_size" {
  description = "maximum worker node number"
  type        = number
  default     = 3
}

variable "asg_min_size" {
  description = "minimum worker node number"
  type        = number
  default     = 3
}

variable "asg_desired_capacity" {
  description = "desired worker node number"
  type        = number
  default     = 3
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