# Provision EBS (Elastic Block Store) with Terraform
In this demo, we will create AWS EBS resource and attach it wiht an EC2 instance.
## About EBS 

## Instructions
1. Clone the project 
```
git clone https://github.com/mehdijebali/Terraform-EBS.git.git
```
2. In the project root directory, create an SS key and name it **levelup_key**
```
ssh-keygen
``` 
3. Export your AWS Credentials
```
export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
export AWS_DEFAULT_REGION=us-west-2
```
4. In the project root directory, initiate Terraform in order to install the declared provider in `provider.tf` file
```
terraform init
```
5. If you want to see your provisionning details, run the following command
```
terraform plan
```
6. Apply modifications
```
terraform apply
```
7. After the creation is completed, SSH to the EC2 instance
```
ssh ec2-user@<public_ip>
```
8. Create a new filesystem
```
mkfs.ext4 /dev/xvdh
```
9. Create a new directory and mount the created filesystem
```
mkdir -p /data
mount /dev/xvdh /data
```
## Expected Results