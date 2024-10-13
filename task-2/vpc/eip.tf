resource "aws_eip" "nat_eip_1" {
  tags = {
    Name = "nat-eip-1"
  }
}

resource "aws_eip" "nat_eip_2" {
  tags = {
    Name = "nat-eip-2"
  }
}
