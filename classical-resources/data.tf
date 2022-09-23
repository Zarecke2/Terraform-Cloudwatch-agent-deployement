##############################################################
# Data sources to get VPC, subnets and domaine details
##############################################################

data "aws_caller_identity" "current" {}

# Data du EC2
data "aws_ami" "cloudwatch-agent-server" {
  most_recent = true
  owners = ["137112412989"]
  filter {
    name = "name"
    values = ["amzn2-ami-hvm-2.0.*-x86_64-gp2*"]
  }
}

# Data du rôle
data "aws_iam_role" "ec2_role_ssm" {
  name = "esgi_EC2_Role"
}