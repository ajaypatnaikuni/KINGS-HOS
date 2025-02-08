terraform {
  backend "s3" {
    bucket         = "ajaydontdelete"  # Separate bucket for dev
    key            = "terraform/state/dev/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-lock"  # Separate lock table for dev
    encrypt        = true
  }
}

/*
terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "terraform/state/${terraform.workspace}/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
} 
*/
