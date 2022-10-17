# Provision EBS (Elastic Block Store) with Terraform
In this demo, we will create AWS EBS resource and attach it wiht an EC2 instance.
## About EBS 
AWS EBS is a level storage device that you can attach to your instances; it is like a secondary disk which is flexible. User can dynamically increase size, modify the provisioned IOPS capacity, and change volume type on live production volumes. We can attach multiple EBS volumes to a single instance. Note that EBS volume and instance must be in the sama Availability Zone. 
There are several kinds of EBS Volumes
#### SSD-backed
SSD-backed volumes are optimized for transactional workloads, where the volume performs a lot of small read/write operations. The performance of such volumes is measured in IOPS (input/output operations per second).
#### HDD-backed
HDD-backed volumes are designed for large sequential workloads where throughput is much more important (and the performance is measured with MiB/s).
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
8. Create a new filesystem after switching to root user
```
sudo -s
mkfs.ext4 /dev/xvdh (EBS Device Name)
```
9. Create a new directory and mount the created filesystem
```
mkdir -p /data
mount /dev/xvdh /data
```
10. Configure fstab file under **/etc** directory by adding the following line. You can use any ubuntu editor like nano or vim
```
/dev/xvdh /data ext4 defaults 0 0
```
## Expected Results
After the provisionning is done, we can verify the implementation of EC2 instance and EBS volume.
#### EC2 Instance
![](./Lab_Results/instance_ebs.png)
#### EBS Volume
![](./Lab_Results/2ndvol.png)