terraform {
  backend "s3" {
    bucket  = "gbtfstate"
    key     = "eks.tfstate"
    region  = "eu-west-1"
    encrypt = "true"
  }
}


provider "aws" {
  version = "~> 2.62.0"
  region  = "eu-west-1"
}
