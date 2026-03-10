# terraform {
#   backend "s3" {
#     bucket         = "devops-terraform-state"
#     key            = "nodejs/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "terraform-lock"
#   }
# }