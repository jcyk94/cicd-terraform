terraform {
  backend "s3" {
    bucket = "sctp-ce5-tfstate-bucket-1"
    key    = "jolchin.tfstate"
    region = "us-east-1"
    #     encrypt = true
    #     dynamodb_table = "value"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

#Resource: aws_sns_topic
resource "aws_sns_topic" "user_updates" {
  name = "jolchin-updates-topic"
}
