# 🚀 Production EKS Cluster on AWS using Terraform

This project sets up a **highly available EKS (Elastic Kubernetes Service)** cluster on AWS using **Terraform modules**, including:
- VPC with public and private subnets
- EKS control plane
- Managed node groups

---

## 📁 Module Structure

```bash
.
├── main.tf                 # Root module that calls sub-modules
├── modules/
│   ├── vpc/                # VPC module
│   ├── eks/                # EKS cluster module
│   └── node_groups/        # Node group module
├── variables.tf            # Root variables
├── outputs.tf              # Root outputs
└── README.md               # Project documentation


```

Architecture Overview
+-----------------------+
|      AWS Region       |
|      (us-west-2)      |
+-----------------------+
         |
         V
+-------------------------------+
|           VPC                |
|  CIDR: 10.0.0.0/16           |
+-------------------------------+
   |                  |
   V                  V
Public Subnets    Private Subnets
10.0.1.0/24        10.0.101.0/24
10.0.2.0/24        10.0.102.0/24
   |                  |
   V                  V
Internet GW     EKS Control Plane + Node Groups


✅ Features

✅ VPC creation with public/private subnets across multiple AZs

✅ Secure EKS cluster provisioning

✅ Managed node groups with auto-scaling

✅ IAM roles for both EKS control plane and EC2 nodes

✅ Kubernetes provider integration for post-deployment config




Getting Started
🛠 Prerequisites

Terraform ≥ 1.3.0

AWS CLI configured (aws configure)

An AWS account with appropriate IAM permissions


🧪 Usage
1. Clone the Repository
git clone https://github.com/your-username/your-repo.git
cd your-repo

2. Initialize Terraform
terraform init

3. Review and Apply the Plan
terraform plan
terraform apply

4. Output

After provisioning, Terraform will output:

VPC ID

Public and Private Subnet IDs

EKS Cluster Name, Endpoint, and CA Data

Node Group Name

📦 Variables
Root Module (main.tf)
Name	Type	Default	Description
aws_region	string	"us-west-2"	AWS Region to deploy to
cluster_name	string	"production-eks-cluster"	Name of the EKS cluster
vpc_cidr	string	"10.0.0.0/16"	CIDR block for VPC
VPC Module
Name	Type	Description
name	string	Prefix for all resources
vpc_cidr	string	CIDR block for VPC
public_subnet_cidrs	list(string)	List of public subnet CIDRs
private_subnet_cidrs	list(string)	List of private subnet CIDRs
availability_zones	list(string)	List of AZs (e.g., ["us-west-2a", "us-west-2b"])
EKS Module
Name	Type	Description
cluster_name	string	Name of the EKS cluster
private_subnet_ids	list(string)	Subnets for control plane
enabled_cluster_log_types	list(string)	EKS logging types (e.g. ["api", "audit"])
Node Groups Module
Name	Type	Default	Description
cluster_name	string	n/a	Name of the EKS cluster
subnet_ids	list(string)	n/a	Subnet IDs for node group
desired_size	number	2	Desired number of worker nodes
max_size	number	3	Maximum number of worker nodes
min_size	number	1	Minimum number of worker nodes
instance_types	list(string)	["t3.medium"]	EC2 instance types for nodes
📤 Outputs
Output Name	Description
vpc_id	The ID of the created VPC
public_subnets	List of public subnet IDs
private_subnets	List of private subnet IDs
eks_cluster_name	Name of the EKS cluster
eks_cluster_endpoint	API server endpoint
eks_cluster_ca_data	Cluster certificate authority data
node_group_name	Name of the EKS node group
🔐 Security Notes

Ensure your IAM roles and policies follow the principle of least privilege.

All nodes are launched in private subnets.

Only expose services you need to via LoadBalancer or Ingress.

🧹 Cleanup

To delete all resources:

terraform destroy

🧾 License

MIT License

🙋‍♂️ Support

For issues, feel free to open a GitHub issue or submit a PR for improvements.

Happy Terraforming! 🚜


Let me know if you'd like this README customized further for a specific team or deployment environment.
