terraform {
  backend "s3" {
    bucket = "my-tf-state-bucket-2123"
    key    = "state/terraform.tfstate"
    region = "us-east-1"
    workspace_key_prefix = "env"
  }
}
