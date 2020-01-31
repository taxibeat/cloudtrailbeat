
data "aws_s3_bucket" "cloudtrailbeat"{
    bucket = "${var.s3_bucket_name}"
}


resource "aws_s3_bucket_notification" "cloudtrailbeat" {
  bucket = "${data.aws_s3_bucket.cloudtrailbeat.id}"

  topic {
    topic_arn     = "${aws_sns_topic.cloudtrailbeat.arn}"
    events        = ["s3:ObjectCreated:*"]
    # filter_suffix = ".log"
  }
}
