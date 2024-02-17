locals {
  topic-name = "update-topic"
}


#Resource: aws_sns_topic
resource "aws_sns_topic" "user_updates" {
#   name = "jolchin-updates-topic"
name =var.abc
}


