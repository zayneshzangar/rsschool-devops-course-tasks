resource "aws_subnet" "subnet_public_rsschool" {
  # count                   = length(var.vpc_public_subnets)
  vpc_id                  = aws_vpc.vpc_rsschool.id
  cidr_block              = var.vpc_public_subnets
  availability_zone       = var.vpc_azs[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.vpc_name}-public"
  }
}

resource "aws_subnet" "subnet_private_rsschool" {
  count             = length(var.vpc_private_subnets)
  vpc_id            = aws_vpc.vpc_rsschool.id
  cidr_block        = var.vpc_private_subnets[count.index]
  availability_zone = var.vpc_azs[count.index % length(var.vpc_azs)]
  tags = {
    Name = "${var.vpc_name}-private-${count.index}"
  }
}
