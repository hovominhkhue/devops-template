provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "../modules/vpc"

  vpc_name           = "staging-vpc"
  vpc_cidr           = "10.1.0.0/16"
  availability_zones = ["us-east-1a", "us-east-1b"]
  public_subnets     = ["10.1.1.0/24", "10.1.2.0/24"]
  private_subnets    = ["10.1.3.0/24", "10.1.4.0/24"]

  environment  = "staging"
  project_name = "my-project"
}

module "eks_cluster" {
  source = "../modules/cluster"

  cluster_name        = "staging-cluster"
  cluster_version     = "1.24"
  node_instance_type  = "t3.medium"
  node_desired_capacity = 2
  node_max_capacity     = 4
  node_min_capacity     = 1

  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets

  environment  = "staging"
  project_name = "my-project"
}