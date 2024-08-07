# EMR general configurations
#name                = "spark-app"
#name                = "s3-spark-bucket-new"
key_name            = "ubuntu-aws-test1"
ingress_cidr_blocks = "0.0.0.0/0"
release_label       = "emr-5.16.0"
applications        = ["Hadoop", "Spark"]

# Master node configurations
master_instance_type = "m5.xlarge"
master_ebs_size      = "50"


# Slave nodes configurations
core_instance_type  = "m5.xlarge"
core_instance_count = 2
core_ebs_size       = "50"