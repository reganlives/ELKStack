variable "aws_access_key" {
  type = string
}

variable "aws_secret_key" {
  type = string
}

variable "name" {
  type    = string
  default = "Rehan"
}

variable "ami_id" {
  type    = string
  default = "ami-089a545a9ed9893b6"
}

variable "ssh_key" {
  type    = string
  default = "new_key1"
}