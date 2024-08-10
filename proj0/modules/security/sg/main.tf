resource "aws_security_group" "sg" {
  name        = "sg"
  description = "Allow some port inbound traffic"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "ingress" {
  count             = length(var.inbound_ports)
  type              = "ingress"
  from_port         = var.inbound_ports[count.index]
  to_port           = var.inbound_ports[count.index]
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.sg.id
}
resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.sg.id
}


