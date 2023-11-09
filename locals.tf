locals {
  project_tags = {
    contact      = "devops@jjtech.com"
    application  = "payments"
    project      = "jjtech"
    environment  = "${terraform.workspace}" # refers to your current workspace (dev, prod, etc)
    creationTime = timestamp()
  }
}