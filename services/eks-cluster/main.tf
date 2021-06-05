data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
  // version                = "~> 1.9"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = "1.20"
  subnets         = data.terraform_remote_state.vpc.outputs.private_subnets
  vpc_id          = data.terraform_remote_state.vpc.outputs.vpc_id

  

  node_groups = {
    private = {
      subnets          = data.terraform_remote_state.vpc.outputs.private_subnets
      desired_capacity = var.desired_capacity
      max_capacity     = var.max_capacity
      min_capacity     = var.min_capacity

      instance_type = var.instance_type
      k8s_labels = {
        Environment = "private"
      }
    }
  }

  // worker_groups = [
  //   {
  //     instance_type = var.instance_type
  //     asg_min_size = var.asg_min_size
  //     asg_desired_capacity = var.asg_desired_capacity
  //     asg_max_size  = var.asg_max_size
  //     root_volume_size = var.root_volume_size
  //     root_volume_type = var.root_volume_type
  //     ebs_optimized = var.ebs_optimized
  //     ami_id = var.ami_id
  //     key_name = var.key_name
  //   }
  // ]

}