
Laboratório de Infraestrutura: AWS + Terraform + Docker 🚀
Este projeto é um laboratório prático focado no provisionamento de infraestrutura escalável na AWS utilizando Terraform e o deploy de uma aplicação containerizada (Flask) via Docker e ECR.

🎯 Objetivos do Projeto
Implementar Infraestrutura como Código (IaC) para provisionar instâncias EC2.

Gerenciar imagens de containers no Amazon ECR (Elastic Container Registry).

Utilizar blocos data no Terraform para integração com infraestruturas existentes (VPC/Subnets).

Validar fluxos de conectividade e segurança de rede.

🛠️ Tecnologias Utilizadas
Terraform: Orquestração da infraestrutura.

Docker: Containerização da aplicação.

AWS (EC2 & ECR): Cloud provider e registro de imagens.

Python/Flask: Web app para validação do deploy.

Shell Script: Automação de comandos iniciais na instância.

🏗️ Arquitetura da Solução
O fluxo consiste em criar um repositório no ECR, realizar o push da imagem local e, através do Terraform, subir uma instância EC2 que puxa essa imagem e a executa na porta 80.

📝 Lições Aprendidas (Troubleshooting)
Este projeto serviu como um importante exercício de depuração de rede. Durante o desenvolvimento, foram enfrentados e resolvidos os seguintes desafios:

Gestão de Estado do ECR: Identificação do erro RepositoryNotEmptyException, resolvido com a limpeza manual/automatizada via AWS CLI antes da destruição do stack.

Segurança e Conectividade (Security Groups):

O ponto crítico de aprendizado foi a necessidade de associação explícita entre o recurso aws_security_group e a aws_instance.

Sem a vinculação correta via vpc_security_group_ids, a instância permanece isolada, impedindo o tráfego HTTP mesmo com o container em execução.

O sucesso do SSH em instâncias sem SG explícito foi identificado como uma atribuição automática ao grupo default da VPC.

🚀 Como Executar
Provisionar Infraestrutura:

Bash
terraform init
terraform apply -auto-approve
Subir Imagem para o ECR:

Bash
aws ecr get-login-password --region <sua-regiao> | docker login --username AWS --password-stdin <seu-id>.dkr.ecr.<sua-regiao>.amazonaws.com
docker build -t repo-projeto-devops .
docker tag repo-projeto-devops:latest <seu-id>.dkr.ecr.<sua-regiao>.amazonaws.com/repo-projeto-devops:latest
docker push <seu-id>.dkr.ecr.<sua-regiao>.amazonaws.com/repo-projeto-devops:latest

