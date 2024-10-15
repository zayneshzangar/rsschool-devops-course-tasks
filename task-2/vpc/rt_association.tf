resource "aws_route_table_association" "rt_association_rsschool_public" {
  count          = length(var.vpc_public_subnets)
  subnet_id      = element(aws_subnet.subnet_public_rsschool.*.id, count.index)
  route_table_id = aws_route_table.rt_rsschool_public.id
}

resource "aws_route_table_association" "rt_association_rsschool_privateA" {
  subnet_id      = element(aws_subnet.subnet_private_rsschool.*.id, 0)
  route_table_id = aws_route_table.rt_rsschool_private_a.id
}

resource "aws_route_table_association" "rt_association_rsschool_privateB" {
  subnet_id      = element(aws_subnet.subnet_private_rsschool.*.id, 1)
  route_table_id = aws_route_table.rt_rsschool_private_b.id
}
