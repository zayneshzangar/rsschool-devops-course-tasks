resource "aws_key_pair" "key_rsschool" {
  key_name   = "key-rsschool"
  public_key = file("~/.ssh/id_rsa.pub")
}