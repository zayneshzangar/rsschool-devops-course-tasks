resource "aws_eip_association" "eip_assoc_bastion_k3s" {
  instance_id   = aws_instance.bastion_k3s.id # Укажите ID инстанса
  allocation_id = data.terraform_remote_state.eip_state.outputs.eip_for_bastion
  depends_on    = [aws_instance.bastion_k3s]
}