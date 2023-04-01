resource "awscc_pipes_pipe" "eventbridge_filter" {
  name = "SQSFilterRedirect"
  role_arn = aws_iam_role.pipe_iam_role.arn

  source = aws_sqs_queue.observer_queue.arn

  source_parameters = {
    sqs = {
      sqs_queue_parameters = {
        batch_size = 1
      }
    }

    filter_criteria = {
      filters = [{ 
        pattern = jsonencode({"body": { "customer_type": ["Platinum"] }})
      }]
    }
  }

  target = aws_sqs_queue.consumer_queue.arn
}  