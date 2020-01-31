terraform {
  backend "s3" {
    bucket         = "beat-audit-tfstate"
    key            = "cloudtrailbeat/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "beat-audit-tfstate"
    profile        = "beat_audit"
  }
}

provider "aws" {

  region = "${var.region}"
  profile  = "${var.aws_account_profile}"
  alias = "audit_account"
}

module "cloudtrailbeat" {
  source = "cloudtrailbeat/"

  provider = "aws.audit_account"

  s3_bucket_name = "${var.s3_bucket_name}"
  sns_topic_name = "${var.sns_topic_name}"
  sns_display_name = "${var.sns_display_name}"
  sqs_queue_name = "${var.sqs_queue_name}"
}