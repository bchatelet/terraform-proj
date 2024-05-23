terraform {
  backend "s3" {
    encrypt = true
    #bucket                   = "my-terraform-persistence"
    bucket                   = "s3-spark-bucket-new"
    key                      = "terraform-emr-pyspark.tfstate"
    shared_credentials_files = ["./credentials.tfvars"]
    shared_config_files      = ["./config.tfvars"]
    region                   = "eu-west-3"
  }
  required_providers {
    aws = {
      version = ">= 1.0"
    }
  }

}



