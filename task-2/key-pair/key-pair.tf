resource "aws_key_pair" "key_pair_rsschool" {
  key_name   = "key-pair-rsschool"
  public_key = file("task-2/key-pair/id_rsa.pub")
}
