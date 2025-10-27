# multi-cloud
Terraform: Multi-Cloud Web Hosting with AWS & GCP (Docker Simulation)
Overview
This project demonstrates a multi-cloud infrastructure setup using Terraform and Docker.
It simulates deploying web servers on AWS and GCP, and then automatically switches traffic to the available server if one goes down — all without using real cloud accounts.
⚙ Tools & Technologies
Terraform — for Infrastructure as Code (IaC)
Docker — to simulate AWS and GCP web servers locally
NGINX — lightweight web server for each container
Initialize Terraform
terraform init
Apply Configuration
terraform apply -auto-approve
Stop the running servers:
docker stop aws-web gcp-web
Destroy the Infrastructure
terraform destroy -auto-approve
