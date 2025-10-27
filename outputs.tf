output "aws_web_url" {
  value = "http://localhost:${var.aws_port}"
}

output "gcp_web_url" {
  value = "http://localhost:${var.gcp_port}"
}
