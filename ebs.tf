#EBS resource Creation
resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = var.AVAILABILITY_ZONE
  size              = var.EBS_SIZE
  type              = var.EBS_TYPE

  tags = {
    Name = "${var.EBS_NAME}"
  }
}

#Atatch EBS volume with AWS Instance
resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = var.EBS_DEVICE_NAME
  volume_id   = aws_ebs_volume.ebs-volume-1.id
  instance_id = module.instance.instance_id
}