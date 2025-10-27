terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.2"
}

provider "docker" {}

# ------------------------
# AWS simulated container
# ------------------------
resource "docker_image" "aws_nginx" {
  name = "nginx:stable"
}

resource "docker_container" "aws_web" {
  name  = "aws-web"
  image = docker_image.aws_nginx.name
  ports {
    internal = 80
    external = 8081
  }

  provisioner "local-exec" {
    command = <<EOT
docker exec aws-web bash -c "echo '<h1>Hello from AWS (Local)</h1>' > /usr/share/nginx/html/index.html"
EOT
    when = "create"
  }
}

# ------------------------
# GCP simulated container
# ------------------------
resource "docker_image" "gcp_nginx" {
  name = "nginx:stable"
}

resource "docker_container" "gcp_web" {
  name  = "gcp-web"
  image = docker_image.gcp_nginx.name
  ports {
    internal = 80
    external = 8082
  }

  provisioner "local-exec" {
    command = <<EOT
docker exec gcp-web bash -c "echo '<h1>Hello from GCP (Local)</h1>' > /usr/share/nginx/html/index.html"
EOT
    when = "create"
  }
}
