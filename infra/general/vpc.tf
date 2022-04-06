resource "aws_vpc" "elasticsearch-vpc" {
  cidr_block       = var.cidr
  instance_tenancy = "default"

  enable_dns_support               = true
  enable_dns_hostnames             = true
  assign_generated_ipv6_cidr_block = false

  tags = {
    Name        = "${var.vpc_name}-vpc"
    Environment = var.tags.Environment
    Terraform   = var.tags.Terraforms
  }
}

resource "aws_subnet" "elasticsearch-vpc-private" {
  vpc_id                          = aws_vpc.elasticsearch-vpc.id
  assign_ipv6_address_on_creation = false
  count                           = length(var.private_subnets)
  availability_zone               = var.availability_zones[count.index]
  cidr_block                      = var.private_subnets[count.index]
  map_public_ip_on_launch         = false

  tags = {
    Name        = join("-", [var.vpc_name, var.availability_zones[count.index]])
    Environment = var.tags.Environment
    Terraform   = var.tags.Terraforms
  }
}

resource "aws_route_table" "elasticsearch-route-table" {
  vpc_id = aws_vpc.elasticsearch-vpc.id
  tags = {
    Name        = "${var.vpc_name}-route-table"
    Environment = var.tags.Environment
    Terraform   = var.tags.Terraforms
  }
}

resource "aws_route_table_association" "elasticsearch-table-association" {
  count          = length(var.private_subnets)
  subnet_id      = element(aws_subnet.elasticsearch-vpc-private.*.id, count.index)
  route_table_id = aws_route_table.elasticsearch-route-table.id
}

resource "aws_security_group" "elasticsearch-security-group" {
  name        = "${var.vpc_name}-default-sg"
  description = "Default security group to allow inbound/outbound from the VPC"
  vpc_id      = aws_vpc.elasticsearch-vpc.id
  depends_on  = [aws_vpc.elasticsearch-vpc]

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }

  tags = {
    Name        = "${var.vpc_name}-security-group"
    Environment = var.tags.Environment
    Terraform   = var.tags.Terraforms
  }
}

resource "aws_ssm_parameter" "ssm-elasticsearch-vpc-private" {
  name        = "/${var.prefix}/elasticsearch-vpc-private"
  description = "The private subnets for the elasticsearch cluster"
  type        = "StringList"
  value       = join(",", aws_subnet.elasticsearch-vpc-private.*.id)
}

resource "aws_ssm_parameter" "ssm-aws_security_group" {
  name        = "/${var.prefix}/aws_security_group"
  description = "The security group for the elasticsearch cluster"
  type        = "String"
  value       = aws_security_group.elasticsearch-security-group.id
}
