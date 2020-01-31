output "sns_topic_arn" {
  value = "${module.cloudtrailbeat.sns_topic_arn}"
}

output "sqs_topic_arn" {
  value = "${module.cloudtrailbeat.sqs_topic_arn}"
}


