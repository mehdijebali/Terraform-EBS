
resource "aws_key_pair" "levelup_key" {
    key_name = var.PATH_TO_PRIVATE_KEY
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}

#Create AWS Instance
resource "aws_instance" "MyFirstInstnace" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = var.INSTANCE_TYPE
  availability_zone = var.AVAILABILITY_ZONE
  key_name      = aws_key_pair.levelup_key.key_name

  tags = {
    Name = "custom_instance"
  }
}

#EBS resource Creation
resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = var.AVAILABILITY_ZONE
  size              = var.EBS_SIZE
  type              = var.EBS_TYPE

  tags = {
    Name = "Secondary Volume Disk"
  }
}

#Atatch EBS volume with AWS Instance
resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.ebs-volume-1.id
  instance_id = aws_instance.MyFirstInstnace.id
}