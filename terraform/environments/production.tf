provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "../modules/vpc"

  vpc_name           = "prod-vpc"
  vpc_cidr           = "10.0.0.0/16"
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_subnets     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnets    = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

  environment  = "production"
  project_name = "my-project"
}

module "eks_cluster" {
  source = "../modules/cluster"

  cluster_name        = "prod-cluster"
  cluster_version     = "1.24"
  node_instance_type  = "t3.large"
  node_desired_capacity = 3
  node_max_capacity     = 5
  node_min_capacity     = 2

  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets

  environment  = "production"
  project_name = "my-project"
}