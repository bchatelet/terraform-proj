terraform {
  backend "s3" {
    bucket = "dev-proj-1-jenkins-remote-state"
    key    = "devops-project-1/jenkins/terraform.tfstate"
    region = "eu-west-3"
  }
}