#sample-mewa-repo
This is used to enable API's , create Virtual Machines in GCP , along with VPC and subnets.
Also assign static IP's to the Virtual Machines.

Terraform apply can be executed with the below command.
terraform apply --vars-file=prod.tfvars

Please be careful in using terraform destroy , as it may disable the API's in GCP.
