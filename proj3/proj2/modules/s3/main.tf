# Define a variable for the bucket name


# Create the S3 bucket
resource "aws_s3_bucket" "data_bucket" {
  bucket = var.bucket_name
  tags = {
    Environment = "Production"
  }
}

# Create an S3 object to represent a "directory"
resource "aws_s3_object" "directory" {
  bucket = aws_s3_bucket.data_bucket.bucket
  key    = "data/"     # The "directory" name with a trailing slash
  source = "/dev/null" # No actual content, just the key
  tags = {
    Environment = "Production"
  }
}





/* resource "aws_s3_object" "bootstrap_action_file" {
  bucket = var.name
  key    = "scripts/bootstrap_actions.sh"
  source = "scripts/bootstrap_actions.sh"
  #depends_on = [aws_s3_bucket.create_bucket]
} */

/* resource "aws_s3_object" "pyspark_quick_setup_file" {
  bucket = var.name
  key    = "scripts/pyspark_quick_setup.sh"
  source = "scripts/pyspark_quick_setup.sh"
  #depends_on = [aws_s3_bucket.create_bucket]
}
 */