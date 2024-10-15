resource "aws_internet_gateway" "igw_rsschool" {
  vpc_id = aws_vpc.vpc_rsschool.id

  tags = {
    Name = "igw_rsschool"
  }
}