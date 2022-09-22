# Définition du VPC
resource "aws_vpc" "vpc" {
  cidr_block       = "10.15.0.0/16"
  instance_tenancy = "default"
  tags = merge(local.aws_tags, { Name = "vpc-esgi-${var.env}" })
}

# Définition du subnet
resource "aws_subnet" "subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.15.1.0/24"
  availability_zone = "${var.region}a" # availability zone a

  tags = merge(local.aws_tags, { Name = "subnet-esgi-${var.env}" })
}
# Définition de la Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(local.aws_tags, { Name = "gateway-esgi-${var.env}" })
}
# Définition pour l'ip publique
resource "aws_route_table" "publique_route" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = merge(local.aws_tags, { Name = "route-table-esgi${var.env}" })
}
# Association dea la route tableg
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.publique_route.id
}
