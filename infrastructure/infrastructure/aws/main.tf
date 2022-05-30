terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = "aucupence-landing-vpc"
  cidr = "10.10.0.0/16"

  azs             = ["${var.aws_region}a", "${var.aws_region}b", "${var.aws_region}c"]
  private_subnets = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
  public_subnets  = ["10.10.101.0/24", "10.10.102.0/24", "10.10.103.0/24"]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.3"

  cluster_name    = "aucupence-eks"
  cluster_version = "1.29"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {
    default = {
      desired_size = 4
      max_size     = 10
      min_size     = 2

      instance_types = ["m6i.large"]
      capacity_type  = "ON_DEMAND"
    }
  }

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true
}

resource "aws_db_subnet_group" "aurora_subnets" {
  name       = "aucupence-aurora-subnets"
  subnet_ids = module.vpc.private_subnets
}

resource "aws_security_group" "aurora_sg" {
  name        = "aucupence-aurora-sg"
  description = "Aurora DB security group"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [module.eks.cluster_security_group_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_rds_cluster" "aurora" {
  engine               = "aurora-postgresql"
  engine_version       = "15.4"
  cluster_identifier   = "aucupence-aurora"
  database_name        = "lending"
  master_username      = var.db_master_username
  master_password      = var.db_master_password
  backup_retention_period = 7
  preferred_backup_window  = "02:00-03:00"
  db_subnet_group_name    = aws_db_subnet_group.aurora_subnets.name
  vpc_security_group_ids  = [aws_security_group.aurora_sg.id]
  storage_encrypted       = true
  kms_key_id              = var.kms_key_id
}

resource "aws_elasticache_subnet_group" "redis_subnets" {
  name       = "aucupence-redis-subnets"
  subnet_ids = module.vpc.private_subnets
}

resource "aws_security_group" "redis_sg" {
  name        = "aucupence-redis-sg"
  description = "Redis cache security group"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port       = 6379
    to_port         = 6379
    protocol        = "tcp"
    security_groups = [module.eks.cluster_security_group_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_elasticache_replication_group" "redis" {
  replication_group_id          = "aucupence-redis"
  replication_group_description = "Redis cache for digital lending platform"

  engine                     = "redis"
  engine_version             = "7.0"
  node_type                  = "cache.t3.medium"
  number_cache_clusters      = 2
  automatic_failover_enabled = true
  at_rest_encryption_enabled = true
  transit_encryption_enabled = true

  subnet_group_name  = aws_elasticache_subnet_group.redis_subnets.name
  security_group_ids = [aws_security_group.redis_sg.id]
}

variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "eu-central-1"
}

variable "db_master_username" {
  description = "Master DB username"
  type        = string
}

variable "db_master_password" {
  description = "Master DB password"
  type        = string
  sensitive   = true
}

variable "kms_key_id" {
  description = "KMS key for encrypting at-rest data"
  type        = string
}
