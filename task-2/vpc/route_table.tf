resource "aws_route_table" "rt_rsschool_public" {
  vpc_id = aws_vpc.vpc_rsschool.id
  tags = {
    Name = "${var.vpc_name}-public-rt"
  }
}

resource "aws_route_table" "rt_rsschool_private" {
  vpc_id = aws_vpc.vpc_rsschool.id
  tags = {
    Name = "${var.vpc_name}-private-rt"
  }
}

# resource "aws_route_table" "rt_rsschool_private_b" {
#   vpc_id = aws_vpc.vpc_rsschool.id
#   tags = {
#     Name = "${var.vpc_name}-privateB-rt"
#   }
# }
