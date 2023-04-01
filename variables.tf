variable "aws_region" {
  default = "us-east-1"
}

variable "aws_profile" {
  default = "default"
}

variable "aws_config_file" {
  type    = list(string)
  default = ["$HOME/.aws/config"]
}

variable "aws_credentials_file" {
  type    = list(string)
  default = ["$HOME/.aws/credentials"]
}

variables "aws_user" {
  default = "myuser"
}
