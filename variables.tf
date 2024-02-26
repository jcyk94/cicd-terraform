variable "abc" {
  type        = string
  default     = "jolchin-updates-topic"
  description = "my topic - user_updates"

}

variable "vpc_id" {
  type    = string
  default = "vpc-02c3cea2893bac90f"
}

variable "ami_id" {
  type        = string
  default     = "ami-0e731c8a588258d0d"
  description = "t2.micro-us-east-1"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "subnet_id" {
  type    = string
  default = "subnet-0d647d78d2309afc0"
}

variable "key_name" {
  type    = string
  default = "jolchin-keypair"
}