resource "aws_vpc_endpoint" "dynamodb-vpce" {
  # vpc_id        = module.vpc.vpc_id
  vpc_id            = aws_vpc.elasticsearch-vpc.id
  service_name      = "com.amazonaws.${var.region}.dynamodb"
  vpc_endpoint_type = "Gateway"


  tags = var.tags
}

resource "aws_vpc_endpoint_route_table_association" "dynamodb-association" {
  # vpc_endpoint_id = aws_vpc_endpoint.dynamodb-vpce.id
  # route_table_id  = module.vpc.vpc_main_route_table_id
  vpc_endpoint_id = aws_vpc_endpoint.dynamodb-vpce.id
  route_table_id  = aws_route_table.elasticsearch-route-table.id
}
