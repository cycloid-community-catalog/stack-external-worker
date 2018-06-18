data "aws_region" "current" {}

variable "bastion_sg_allow" {
  default = ""
}

variable "metrics_sg_allow" {
  default = ""
}

variable "project" {
  default = "external-worker"
}

variable "customer" {}

variable "env" {}

variable "short_region" {
  type = "map"

  default = {
    ap-northeast-1 = "ap-no1"
    ap-northeast-2 = "ap-no2"
    ap-southeast-1 = "ap-so1"
    ap-southeast-2 = "ap-so2"
    eu-central-1   = "eu-ce1"
    eu-west-1      = "eu-we1"
    sa-east-1      = "sa-ea1"
    us-east-1      = "us-ea1"
    us-west-1      = "us-we1"
    us-west-2      = "us-we2"
  }
}

variable "keypair_name" {
  default = "cycloid"
}

variable "private_subnets_ids" {
  type = "list"
}

variable "public_subnets_ids" {
  type = "list"
}

variable "zones" {
  default = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}

variable "vpc_id" {}

#
# worker
#
variable "worker_count" {}
variable "worker_spot_price" {}

variable "worker_extra_args" {
  default = ""
}

variable "worker_disk_size" {
  default = "20"
}

variable "worker_disk_type" {
  default = "gp2"
}

variable "worker_volume_disk_size" {
  default = "50"
}

variable "worker_volume_disk_type" {
  default = "gp2"
}

variable "worker_type" {}

variable "worker_ebs_optimized" {}

variable "worker_associate_public_ip_address" {
  default = true
}

variable "worker_asg_min_size" {
  default = 1
}

variable "worker_asg_max_size" {
  default = 2
}

variable "worker_asg_scale_up_scaling_adjustment" {
  default = 1
}

variable "worker_asg_scale_up_cooldown" {
  default = 300
}

variable "worker_asg_scale_up_threshold" {
  default = 80
}

variable "worker_asg_scale_down_scaling_adjustment" {
  default = -1
}

variable "worker_asg_scale_down_cooldown" {
  default = 300
}

variable "worker_asg_scale_down_threshold" {
  default = 40
}
