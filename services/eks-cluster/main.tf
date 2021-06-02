data "aws_eks_cluster" "cluster" {
  name = module.my-cluster.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.my-cluster.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
  version                = "~> 1.9"
}

module "my-cluster" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = "1.17"
  subnets         = var.subnets
  vpc_id          = var.vpc_id

  

  worker_groups = [
    {
      instance_type = var.instance_type
      asg_min_size = var.asg_min_size
      asg_desired_capacity = var.asg_desired_capacity
      asg_max_size  = var.asg_max_size
      root_volume_size = var.root_volume_size
      root_volume_type = var.root_volume_type
      ebs_optimized = var.ebs_optimized
      ami_id = var.ami_id
      key_name = var.key_name
    }
  ]
}