resource "tls_private_key" "pk_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "key_pair_rsschool" {
  key_name   = "key-pair-rsschool"
  public_key = tls_private_key.pk_key.public_key_openssh
}

output "private_key" {
  value     = tls_private_key.my_key.private_key_pem
  sensitive = true
}
