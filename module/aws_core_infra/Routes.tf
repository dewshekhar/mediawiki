
resource "aws_route_table" "pub_routes" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${lower(var.app_name)}-pub-route-table"
  }
}

resource "aws_route" "pri_route_nat" {
  route_table_id         = aws_route_table.pri_routes_nat.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}

resource "aws_route_table_association" "associations_pub1" {
  subnet_id      = aws_subnet.pub_sub1.id
  route_table_id = aws_route_table.pub_routes.id
}
resource "aws_route_table_association" "associations_pub2" {
  subnet_id      = aws_subnet.pub_sub2.id
  route_table_id = aws_route_table.pub_routes.id
}
resource "aws_route_table" "pri_routes_nat" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${lower(var.app_name)}-pri-route-table"
  }
}
resource "aws_main_route_table_association" "association" {
  vpc_id         = aws_vpc.main.id
  route_table_id = aws_route_table.pri_routes_nat.id
}
resource "aws_route_table_association" "private_associations" {
  subnet_id      = aws_subnet.pri_sub1.id
  route_table_id = aws_route_table.pri_routes_nat.id
}
resource "aws_route_table_association" "private_associations2" {
  subnet_id      = aws_subnet.pri_sub2.id
  route_table_id = aws_route_table.pri_routes_nat.id
}