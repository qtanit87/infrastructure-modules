output "vpc_name" {
  description = "The VPC name"
  value       = module.vpc.name
}

output "vpc_id" {
  description = "The VPC ID"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "The VPC CIDR block"
  value       = module.vpc.vpc_cidr_block
}

output "public_subnets_cidr_blocks" {
  description = "The CIDR blocks of the public subnets"
  value       = module.vpc.public_subnets_cidr_blocks
}

output "private_subnets_cidr_blocks" {
  description = "The CIDR blocks of the private app subnets"
  value       = module.vpc.private_subnets_cidr_blocks
}

// output "private_persistence_subnet_cidr_blocks" {
//   description = "The CIDR blocks of the private persistence subnets"
//   value       = module.vpc.private_persistence_subnet_cidr_blocks
// }

output "public_subnets" {
  description = "The IDs of the public subnets"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "The IDs of the private app subnets"
  value       = module.vpc.private_subnets
}

// output "private_persistence_subnet_ids" {
//   description = "The IDs of the private persistence subnets"
//   value       = module.vpc.private_persistence_subnet_ids
// }

output "vpc_tags" {
  description = "The tags of vpc"
  value       = module.vpc.vpc_tags
}

output "public_subnet_tags" {
  description = "The tags of public_subnet_tags"
  value       = module.vpc.public_subnet_tags
}

output "private_subnet_tags" {
  description = "The tags of private_subnet_tags"
  value       = module.vpc.private_subnet_tags
}