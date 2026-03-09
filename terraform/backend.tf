terraform {
  backend "s3" {
    bucket         = "devops-terraform-state"
    key            = "nodejs/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock"
  }
}