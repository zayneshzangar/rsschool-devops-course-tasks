resource "aws_nat_gateway" "nat_gw_1" {
  allocation_id = aws_eip.nat_eip_1.id
  subnet_id     = element(aws_subnet.subnet_public_rsschool.*.id, 0) # use the first public subnet

  tags = {
    Name = "${var.vpc_name}-nat-gateway-1"
  }
}

# resource "aws_nat_gateway" "nat_gw_2" {
#   allocation_id = aws_eip.nat_eip_2.id
#   subnet_id     = element(aws_subnet.subnet_public_rsschool.*.id, 1) # use the first public subnet

#   tags = {
#     Name = "${var.vpc_name}-nat-gateway-2"
#   }
# }
