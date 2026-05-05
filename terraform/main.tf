
resource "aws_instance" "machine" {
    
  ami           = var.my_system
  instance_type = var.my_maquina
  subnet_id     = data.aws_subnets.selecionadas.ids[0]

  associate_public_ip_address = true

  tags = {
    Name = "Projeto-Final-Hoje"
  }
}