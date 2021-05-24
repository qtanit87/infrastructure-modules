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

variable "asg_max_size for cluster" {
  description = "maximum worker node number"
  type        = number
  default     = 1
}