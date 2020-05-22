locals {
  cluster_name = "gbeks"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "gbvpc"
  cidr = "192.168.0.0/23"

  azs             = ["eu-west-1a", "eu-west-1b"]
  private_subnets = ["192.168.0.0/25", "192.168.1.0/25"]
  public_subnets  = ["192.168.0.224/27", "192.168.1.224/27"]

  enable_dns_support   = true
  enable_dns_hostnames = true
  enable_nat_gateway   = true
  single_nat_gateway   = true

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

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
  version                = "~> 1.11"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = local.cluster_name
  cluster_version = "1.16"
  subnets         = concat(module.vpc.private_subnets, module.vpc.public_subnets)
  vpc_id          = module.vpc.vpc_id
  manage_aws_auth = true

  cluster_endpoint_private_access      = true
  cluster_endpoint_public_access       = true

  # No need to set extra security group if node group is used
  cluster_create_security_group = false
  worker_create_security_group  = false

  node_groups = [
    {
      name             = "group1"
      instance_type    = "t3a.medium"
      desired_capacity = 1
      disk_size        = 16
      max_capacity     = 2
      min_capacity     = 1
      subnets          = module.vpc.private_subnets
    }
  ]
}
