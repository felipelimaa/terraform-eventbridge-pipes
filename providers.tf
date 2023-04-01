provider "aws" {
  shared_config_files      = var.aws_config_file
  shared_credentials_files = var.aws_credentials_file
  profile                  = var.aws_profile
  region                   = var.aws_region
  default_tags {
    tags = {
      Service = "eventbridge-pipes"
      Repo    = "https://github.com/felipelimaa/terraform-eventbridge-pipes"
    }
  }
}

provider "awscc" {
  region                   = var.aws_region
  shared_config_files      = var.aws_config_file
  shared_credentials_files = var.aws_credentials_file
  profile                  = var.aws_profile
}
