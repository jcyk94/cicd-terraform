terraform {
  backend "s3" {
    #     bucket = "sctp-ce5-tfstate-bucket-1"
    bucket = "jolchin-bucket"
    key    = "jolchin.tfstate"
    region = "us-east-1"
    #     encrypt = true
    #     dynamodb_table = "value"
  }
}
