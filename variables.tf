variable "aws_region" {
  default = "us-west-2"
}

variable "cluster_name" {
  default = "production-eks-cluster"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

# Add more as needed (e.g., instance types, scaling config, tags)

