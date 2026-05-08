
resource "aws_security_group" "allow_sg" {
  name        = "allow_sg"
  description = "Controle trafego de dados na rota"
  vpc_id      = var.vpc_my

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ssh" {
  security_group_id = aws_security_group.allow_sg.id
  cidr_ipv4         = "0.0.0.0/0" # Ajustado para IPv4
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_http" {
  security_group_id = aws_security_group.allow_sg.id
  cidr_ipv4         = "0.0.0.0/0" # Ajustado para IPv4
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_https" { # Nome único
  security_group_id = aws_security_group.allow_sg.id
  cidr_ipv4         = "0.0.0.0/0" # Ajustado para IPv4
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic" {
  security_group_id = aws_security_group.allow_sg.id
  cidr_ipv4         = "0.0.0.0/0" # Ajustado para IPv4
  ip_protocol       = "-1" 
}
