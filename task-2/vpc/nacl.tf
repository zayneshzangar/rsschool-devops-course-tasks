# resource "aws_network_acl" "rsschool_nacl" {
#   vpc_id     = aws_vpc.vpc_rsschool.id
#   subnet_ids = [aws_subnet.subnet_public_rsschool.id]
#   tags = {
#     name    = "${var.vpc_name}-dmz-nacl"
#   }
# }

# # Allow SSH (port 22)
# resource "aws_network_acl_rule" "allow_ssh" {
#   network_acl_id = aws_network_acl.rsschool_nacl.id
#   rule_number    = 100
#   egress         = false
#   protocol       = "tcp"
#   rule_action    = "allow"
#   cidr_block     = "0.0.0.0/0"
#   from_port      = 22
#   to_port        = 22
# }

# # Allow ICMP (Ping)
# resource "aws_network_acl_rule" "allow_icmp" {
#   network_acl_id = aws_network_acl.rsschool_nacl.id
#   rule_number    = 101
#   egress         = false
#   protocol       = "icmp"
#   rule_action    = "allow"
#   cidr_block     = "0.0.0.0/0"
#   from_port      = -1
#   to_port        = -1
# }

# # Deny all other inbound traffic
# resource "aws_network_acl_rule" "deny_all_inbound" {
#   network_acl_id = aws_network_acl.rsschool_nacl.id
#   rule_number    = 110
#   egress         = false
#   protocol       = "-1"
#   rule_action    = "deny"
#   cidr_block     = "0.0.0.0/0"
# }

# # Allow all outbound traffic
# resource "aws_network_acl_rule" "allow_all_outbound" {
#   network_acl_id = aws_network_acl.rsschool_nacl.id
#   rule_number    = 100
#   egress         = true
#   protocol       = "-1"
#   rule_action    = "allow"
#   cidr_block     = "0.0.0.0/0"
# }
