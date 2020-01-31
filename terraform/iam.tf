resource "aws_iam_policy" "cloudtrailbeat" {
    name = "CloudTrailBeat-Policy"

    policy= <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowS3BucketAccess",
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::${var.s3_bucket_name}"
            ]
        },
        {
            "Sid": "AllowObjectRetrieval",
            "Effect": "Allow",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::${var.s3_bucket_name}/*"
            ]
        },
        {
            "Sid": "AllowSQS",
            "Effect": "Allow",
            "Action": [
                "sqs:DeleteMessage",
                "sqs:ReceiveMessage",
                "sqs:SendMessage"
            ],
            "Resource": [
                "arn:aws:sqs:${aws_sqs_queue.cloudtrailbeat.arn}"
            ]
        }
    ]
}
POLICY

  tags = {
    ManagedBy = "Terraform",
    Deployment = "cloudtrailbeat"
  }
}

resource "aws_iam_role" "cloudtrailbeat" {
 
    name = "K8s-CloudTrailBeat-Policy-Role"
    description = "Role for deploying 'cloudtrailbeat' in k8s pods"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      }
    },
    {
      "Sid": "",
      "Effect": "Allow",
      "Action": "sts:AssumeRole",
      "Principal": {
        "AWS": "${var.kubernetes_worker_principal}"
      }
    }
  ]
}
EOF
  tags = {
    ManagedBy = "Terraform",
    Deployment = "cloudtrailbeat"
  }
}