
data "aws_subnets" "selecionadas" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_my] #[cite: 2]
  }
}

resource "aws_s3_bucket" "bucket_sg" {
  bucket = "projeto-devops-alexandre-unico-2026"

  tags = {
    Name        = "My bucket"
    Environment = "DevAlexandre"
  }
}







