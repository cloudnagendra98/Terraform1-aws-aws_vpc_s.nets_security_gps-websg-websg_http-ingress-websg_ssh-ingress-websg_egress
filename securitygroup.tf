resource "aws_security_group" "websg" {
  name        = "websg"
  description = "This is security group"
  vpc_id      = aws_vpc.ntier_vpc.id
  tags = {
    Name = "websg"
  }

  depends_on = [
    aws_vpc.ntier_vpc
  ]

}

resource "aws_security_group_rule" "websg_http" {
  type              = "ingress"
  protocol          = "tcp"
  security_group_id = aws_security_group.websg.id
  cidr_blocks       = ["0.0.0.0/0"]
  #cidr_blocks = aws_vpc.ntier_vpc.cidr_block this is documentation example process
  to_port   = "80"
  from_port = "80"

  depends_on = [
    aws_security_group.websg
  ]


}

resource "aws_security_group_rule" "websg_ssh" {
  type              = "ingress"
  protocol          = "tcp"
  security_group_id = aws_security_group.websg.id
  cidr_blocks       = ["0.0.0.0/0"]
  to_port           = 22
  from_port         = 22

  depends_on = [
    aws_security_group.websg
  ]

}

resource "aws_security_group_rule" "websg_out" {
  type              = "egress"
  protocol          = "-1"
  security_group_id = aws_security_group.websg.id
  cidr_blocks       = ["0.0.0.0/0"]
  to_port           = 65535
  from_port         = 0

  depends_on = [
    aws_security_group.websg
  ]

}