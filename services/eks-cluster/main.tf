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
  version                = "~> 1.9"
}

data "aws_availability_zones" "available" {
}

resource "aws_security_group" "worker_group_mgmt_one" {
  name_prefix = "worker_group_mgmt_one"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "10.0.0.0/8",
    ]
  }
}

resource "aws_security_group" "all_worker_mgmt" {
  name_prefix = "all_worker_management"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "10.0.0.0/8",
      "172.16.0.0/12",
      "192.168.0.0/16",
    ]
  }
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = "1.20"
  subnets         = data.terraform_remote_state.vpc.outputs.public_subnets
  cluster_endpoint_private_access = true
  vpc_id          = data.terraform_remote_state.vpc.outputs.vpc_id

  

  node_groups = {
    public = {
      subnets          = data.terraform_remote_state.vpc.outputs.public_subnets
      desired_capacity = var.asg_min_size
      max_capacity     = var.asg_max_size
      min_capacity     = var.asg_min_size

      instance_type = var.instance_type
      k8s_labels = {
        Environment = "public"
      }
    }
    // private = {
    //   subnets          = data.terraform_remote_state.vpc.outputs.private_subnets
    //   desired_capacity = var.asg_min_size
    //   max_capacity     = var.asg_max_size
    //   min_capacity     = var.asg_min_size

    //   instance_type = var.instance_type
    //   k8s_labels = {
    //     Environment = "private"
    //   }
    // }
  }

  // worker_groups = [
  //   {
  //     name                          = "worker-group-1"
  //     instance_type                 = var.instance_type
  //     asg_min_size                  = var.asg_min_size
  //     asg_desired_capacity          = var.asg_desired_capacity
  //     asg_max_size                  = var.asg_max_size      
  //     additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
  //   }
  // ]
  // worker_additional_security_group_ids = [aws_security_group.all_worker_mgmt.id]

  // root_volume_size              = var.root_volume_size
  // root_volume_type              = var.root_volume_type
  // ebs_optimized                 = var.ebs_optimized
  // ami_id                        = var.ami_id
  // key_name                      = var.key_name
}