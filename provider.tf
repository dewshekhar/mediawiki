provider "aws" {
  version = "~> 3.0,!= 3.20.0"
  region = "us-west-1"
}

terraform {
  backend "s3" {
    bucket = "default-terraform-s3-bucket"
    key    = "MediaWiki/mediawiki_dp.tfstate"
    region = "us-west-1"
  }
}