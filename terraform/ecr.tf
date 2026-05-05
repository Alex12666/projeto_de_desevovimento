resource "aws_ecr_repository" "projeto_repo" {
  name                 = "repo-projeto-devops" # Mesmo nome que está no segredo/script
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Projeto = "DevCars"
  }
}

output "ecr_repository_url" {
  value = aws_ecr_repository.projeto_repo.repository_url
}