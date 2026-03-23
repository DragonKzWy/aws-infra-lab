# AWS Infrastructure Lab — Public Web Server with Nginx

## Overview

This project demonstrates the creation of a basic AWS infrastructure using a custom VPC and a public EC2 instance running Nginx.

The objective is to simulate a real-world cloud environment with explicit networking configuration, security controls, and service deployment.

---

## Architecture

```
Internet
   ↓
Internet Gateway
   ↓
Route Table (0.0.0.0/0 → IGW)
   ↓
Public Subnet
   ↓
EC2 (Amazon Linux)
   ↓
Nginx Web Server
```

---

## Technologies Used

- AWS VPC
- AWS EC2
- Internet Gateway (IGW)
- Route Tables
- Security Groups
- Amazon Linux 2023
- Nginx

---

## Infrastructure Details

### VPC
- CIDR: `10.0.0.0/16`
- Custom VPC (no default resources used)

---

### Subnet
- Name: `public-subnet-1a`
- CIDR: `10.0.1.0/24`
- Availability Zone: `us-east-2a`

---

### Internet Access
- Internet Gateway attached to VPC
- Route configured:
  ```
  0.0.0.0/0 → IGW
  ```

---

### Security Group (`web-sg`)

**Inbound rules:**
- SSH (22) → restricted to my IP
- HTTP (80) → open to the internet

**Outbound rules:**
- All traffic allowed

---

### EC2 Instance
- Name: `nginx-server`
- AMI: Amazon Linux 2023
- Instance type: t3.micro
- Public IP enabled
- Subnet: public-subnet-1a

---

## Nginx Setup

Commands executed on the instance:

```bash
sudo dnf update -y
sudo dnf install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
```

---

## Access

The application is accessible via:

```
http://<PUBLIC-IP>
```

---

## Key Engineering Decisions

### Custom VPC
The default VPC was intentionally avoided to gain full control over networking configuration.

---

### CIDR /16
The `10.0.0.0/16` range was chosen to allow scalability and future subnet segmentation.

---

### Public Subnet
A public subnet was used to allow direct internet access to the EC2 instance.

---

### Security Group Design
- SSH access restricted to a single IP for security
- HTTP open to allow public access to the application

---

## Limitations (Current Architecture)

This setup is not production-ready:

- No HTTPS (TLS encryption)
- Single EC2 instance (no high availability)
- No load balancing
- No auto scaling
- No monitoring or logging

---

## Future Improvements

- Application Load Balancer (ALB)
- Multi-AZ deployment
- Auto Scaling Group
- HTTPS with AWS Certificate Manager (ACM)
- CI/CD pipeline
- Infrastructure as Code (Terraform)

---

## Learning Outcomes

- Understanding AWS networking fundamentals
- Designing custom VPCs and subnets
- Configuring internet access via IGW and route tables
- Applying security group rules
- Provisioning EC2 instances
- Deploying and validating a web server (Nginx)

---

## Project Structure (Suggested)

```
aws-infra-lab/
│
├── README.md
├── docs/
│   ├── architecture.md
│   └── screenshots/
│
└── scripts/
    └── install-nginx.sh
```

---

## Automation Script (Optional)

```bash
#!/bin/bash

sudo dnf update -y
sudo dnf install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
```

---

## Author

Project developed as part of a Cloud/DevOps transition portfolio.
