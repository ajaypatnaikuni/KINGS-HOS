module "vpc" {
  source              = "../../modules/vpc"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  azs                 = var.azs
}

module "eks" {
  source        = "../../modules/eks"
  cluster_name  = var.cluster_name
  subnet_ids    = module.vpc.public_subnets
}

module "iam" {
  source = "../../modules/iam"
}

module "ecr" {
  source          = "../../modules/ecr"
  repository_name = var.ecr_repository_name
}
