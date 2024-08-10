data "aws_availability_zones" "available" {}

/* resource "aws_subnet" "public_subnets" {
  count                   = 3  # Adjust based on your needs
  vpc_id                  = aws_vpc.mongolab_vpc.id
  cidr_block              = "10.0.${count.index*2+1}.0/24"
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch = true
}
 */

resource "aws_vpc" "mongolab_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "subnets" {
  count                   = var.subnet_count
  vpc_id                  = aws_vpc.mongolab_vpc.id
  cidr_block              = "10.0.${count.index * 2 + 1}.0/24"
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "mongolab_igw" {
  vpc_id = aws_vpc.mongolab_vpc.id
}

resource "aws_route_table" "mongolab_route_table" {
  vpc_id = aws_vpc.mongolab_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mongolab_igw.id
  }

  tags = {
    Name = "mongolab_route_table"
  }
}

resource "aws_route_table_association" "mongolab_route_association" {
  count          = length(aws_subnet.subnets.*.id)
  subnet_id      = aws_subnet.subnets[count.index].id
  route_table_id = aws_route_table.mongolab_route_table.id
}

