module "vpc" {
  source = "./modules/vpc"

  name                  = var.cluster_name
  vpc_cidr              = var.vpc_cidr
  public_subnet_cidrs   = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs  = ["10.0.101.0/24", "10.0.102.0/24"]
  availability_zones    = ["us-west-2a", "us-west-2b"]
}

module "eks" {
  source = "./modules/eks"

  cluster_name         = var.cluster_name
  private_subnet_ids   = module.vpc.private_subnets
  enabled_cluster_log_types = ["api", "audit", "authenticator"]
}

module "node_groups" {
  source = "./modules/node_groups"

  cluster_name  = var.cluster_name
  subnet_ids    = module.vpc.private_subnets

  desired_size = 2
  max_size     = 3
  min_size     = 1
  instance_types = ["t3.medium"]
}

