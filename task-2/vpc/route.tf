resource "aws_route" "public_igw_route" {
  route_table_id         = aws_route_table.rt_rsschool_public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw_rsschool.id
  timeouts {
    create = "5m"
  }
}

resource "aws_route" "private_nat_route_a" {
  route_table_id         = aws_route_table.rt_rsschool_private_a.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gw_1.id
}

resource "aws_route" "private_nat_route_b" {
  route_table_id         = aws_route_table.rt_rsschool_private_b.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gw_2.id
}
