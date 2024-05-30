# resource "aws_vpc" "ntier_vpc" {
#     cidr_block = "10.10.0.0/16"
#     tags = {
#       Name = "ntier"
#     }

# }

resource "aws_vpc" "ntier_vpc" {
  cidr_block = var.vpc_network_cidr
  tags = {
    Name = local.name # This is from internals.tf
  }

}


resource "aws_subnet" "subnet1" {
  count      = length(var.subnets_names)
  vpc_id     = aws_vpc.ntier_vpc.id
  cidr_block = cidrsubnet(var.vpc_network_cidr, 8, count.index)
  #cidr_block = (var.subnets_cidr_range, count.index)
  tags = {
    Name = var.subnets_names[count.index]
  }
  depends_on = [
    aws_vpc.ntier_vpc
  ]
}


# resource "aws_subnet" "subnet1" {
#     vpc_id = aws_vpc.ntier_vpc.id
#     cidr_block = "10.10.0.0/24"

#     tags = {
#       Name = "web"
#     }

# }

