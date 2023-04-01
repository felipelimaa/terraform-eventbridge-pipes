# EventBridge Pipes with Terraform

This project has created for deploy a new EventBridge Pipes in AWS using Infrastructure as Code (IaC).

## Project ideia ##
1. Listening to Messages on an SQS Queue (ObserverQueue).
2. When a Message have been received to SQS, the EventBridge Pipe will be triggered and start the Pipe execution.
3. The EventBridge Pipe will execute all configured steps. In this case, only filter.
4. If the filtered message matches the filter criteria, the message is sent to another SQS Queue (ConsumeQueue).

![EventBridge Pipes](event-bridge-pipe.jpg?raw=true)

## Prerequisites for execution ##
* Terraform version >= `1.4.0`
> Although hashicorp reports 0.13 as the minimum version to use awscc, it doesn't work with this version. For me, it took version 1.4 to work.
> For more information about to install another version of terraform, follow this [page](https://developer.hashicorp.com/terraform/downloads)

## Running the project ##
* First you need to configure `aws cli`. For this, you can follow the [AWS page](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html) to do that.
* After configure `aws cli`, go to the folder where this project is located and execute the commands below:
    * :calling: Starting the terraform and downloading providers.
    ```sh
    terraform init
    ```
    * :pencil: Planning your code.
    ```sh
    terraform plan
    ```
    * :hammer: Applying your code.
    ```sh
    terraform apply
    ```
    > :point_up: After run this command, your infrastructure will be created in your provider. In this case, in AWS.
    * :boom: Destroying your infrastructure at the provider.
    ```sh
    terraform destroy
    ```

## Messages Example ##
```
{ 
    "customer_type": "Platinum"
}
```
```
{ 
    "customer_type": "Gold"
}
```

## Thanks ##
[EventBridge Pipes Using Terraform By Duleendra Shashimal](https://towardsaws.com/eventbridge-pipes-using-terraform-ae3abe6266cc)