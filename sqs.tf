resource "aws_sqs_queue" "observer_queue" {
  name          = "ObserverQueue"
}

resource "aws_sqs_queue" "consumer_queue" {
  name          = "ConsumeQueue"
}