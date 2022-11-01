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
  default = "ami-0fb653ca2d3203ac1"
}

variable "ssh_key" {
  type    = string
  default = "new_key1"
}