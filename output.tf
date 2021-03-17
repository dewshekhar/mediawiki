output "endpoint_url" {
  description = "URL of public lb"
  value = aws_lb.lb.dns_name
}

output "Host" {
  description = "db instance"
  value = "localhost"
}

output "Username" {
  description = "database user name"
  value = "wiki"
}
output "Database_Name" {
  description = "database name"
  value = "wikidatabase"
} 
output "Password" {
  description = "wiki password"
  value = "admin@passmedia123"
} 
