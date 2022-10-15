# Provision EBS (Elastic Block Store) with Terraform
## About EBS 
## Instructions
1. Clone the project 
```
git clone https://github.com/mehdijebali/Terraform-EBS.git.git
```
2. Export your AWS Credentials
```
export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
export AWS_DEFAULT_REGION=us-west-2
```
3. In the project root directory, initiate Terraform in order to install the declared provider in `provider.tf` file
```
terraform init
```
4. If you want to see your provisionning details, run the following command
```
terraform plan
```
5. Apply modifications
```
terraform apply
```
## Expected Results