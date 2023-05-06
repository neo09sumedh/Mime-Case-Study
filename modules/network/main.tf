locals{
    app_name="Mine-IT"
}
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
}
resource "aws_subnet" "PublicSubnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.publicSubnet
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  tags = {
    Name = "${local.app_name}-Public-Subnet"
  }
}
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${local.app_name}-Igw"
  }
  depends_on  = [aws_subnet.PublicSubnet]
}
resource "aws_route_table" "PublicRoute" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
   tags = {
   Name = "${local.app_name}SecondaryRouteTable"
 }
}
resource "aws_route_table_association" "publicsubnetassociation" {  
  subnet_id      = aws_subnet.PublicSubnet.id
  route_table_id = aws_route_table.PublicRoute.id
}
                                                       