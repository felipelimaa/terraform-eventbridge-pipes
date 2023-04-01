data "aws_region" "current" {}

data "aws_iam_user" "user" {
  user_name = var.aws_user
}

resource "aws_iam_access_key" "access_key" {
  user = data.aws_iam_user.user.user_name
}

data "aws_iam_policy_document" "pipe_assume_policy_document" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["pipes.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "pipe_iam_policy_document" {
  statement {
    sid    = "AllowPipeToAccessSQS"
    effect = "Allow"
    actions = [
      "sqs:ReceiveMessage",
      "sqs:DeleteMessage",
      "sqs:GetQueueAttributes"
    ]
    // Source queue Resource from Pipe
    resources = [aws_sqs_queue.observer_queue.arn]
  }
}

resource "aws_iam_role" "pipe_iam_role" {
  name               = "pipe-sqs-role"
  assume_role_policy = data.aws_iam_policy_document.pipe_assume_policy_document.json
}

resource "aws_iam_role_policy" "pipe_iam_role_permission_policy" {
  role   = aws_iam_role.pipe_iam_role.id
  policy = data.aws_iam_policy_document.pipe_iam_policy_document.json
}
