terraform {
  required_providers {
    # Define the AWS provider
    aws = {
      source = "hashicorp/aws"
      version = "5.40.0"
    }
  }
}

# Configure the AWS provider
provider "aws" {
  region = "eu-west-3"  # Paris region (could be exported as environment variable AWS_DEFAULT_REGION)
}

# Generate a random ID for the bucket name
resource "random_id" "rnd_id" {
  byte_length = 8
}

# Create the S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "tp-2-bucket-${random_id.rnd_id.hex}"
}

# Configure the bucket ACL (Access Control List) to allow public read access
resource aws_s3_bucket_acl "my_bucket_acl" {
  bucket = aws_s3_bucket.my_bucket.id
  acl    = "public-read"
}

# Configure the bucket to serve as an HTTP server
resource "aws_s3_bucket_website_configuration" "http_bucket_config" {
  bucket = aws_s3_bucket.my_bucket.id

  index_document {  # Index document served if no file is specified
    suffix = "index.html"
  }

  error_document {  # Error document served if 4XX error occurs
    key = "error.html"
  }
}

# Upload the index.html file to the bucket
resource "aws_s3_object" "index_html_file" {
  bucket = aws_s3_bucket.my_bucket.id
  key    = "index.html"
  source = "./index.html"
}

# Output the bucket URL to Terraform CLI
output "bucket_url" {
  value = aws_s3_bucket.my_bucket.website_endpoint
  # It will be like: http://bucket-name.s3-website.Region.amazonaws.com
}