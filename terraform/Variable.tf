variable "vpc_my" {
  description = "ID da VPC padrão do projeto"
  type        = string
  default     = "vpc-0b035c53122a353a8"

}

variable "my_maquina" {
  type    = string
  default = "t3.micro"
}


variable "my_system" {
  type    = string
  default = "ami-0fe18bc3cfa53a248"
}


variable "my_subnet" {
  type    = string
  default = ""

}