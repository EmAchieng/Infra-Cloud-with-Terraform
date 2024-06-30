provider "aws" {
  region = "eu-central-2"
}

# Defines the main VPC with specified CIDR block
module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr_block      = var.vpc_cidr_block
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  db_subnet_cidrs      = var.db_subnet_cidrs
}

module "nat_gateway_alb" {
  source = "./modules/nat_gateway_alb"
  vpc_id = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
}

module "ec2" {
  source = "./modules/ec2"
  public_subnet_id = module.vpc.public_subnet_ids[0]
  vpc_id           = module.vpc.vpc_id
}

module "ecs" {
  source = "./modules/ecs"
}

module "db" {
  source = "./modules/db"
}
