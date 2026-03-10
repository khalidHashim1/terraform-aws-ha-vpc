# 🌐 High Availability VPC on AWS

**Multi-AZ, secure, and fully automated with Terraform**

---

### 🚨 Problem
Many enterprise applications are vulnerable to downtime and network failures when deployed in a single Availability Zone (AZ). Common issues include:
- ❌ **AZ failures**: If the AZ hosting your workloads goes down, all services fail.
- ❌ **Single point of internet access**: Private workloads cannot reliably reach the internet.
- ❌ **Scalability limitations**: Manual subnet and route management across AZs is error-prone.

These challenges lead to **service interruptions, poor user experience, and operational complexity**.

---

### 💡 Solution
This Terraform project provisions a **High Availability VPC** across multiple AWS Availability Zones (AZs) to solve the problems above:

- **Multi-AZ Public & Private Subnets**
  - Public subnets host NAT Gateways & optional Load Balancers.
  - Private subnets host applications isolated from the internet.
  - Distribution across **2+ AZs ensures resilience** against AZ-specific failures.

- **Highly Available Internet & NAT Access**
  - Internet Gateway (IGW) for public subnets.
  - NAT Gateways in each public subnet for reliable private subnet internet access.
  - Route tables configured per subnet to avoid single points of failure.

- **Infrastructure as Code (IaC) Benefits**
  - Fully automated and reproducible environment with Terraform.
  - Modular `.tf` files for VPC, subnets, NAT, and routing.
  - Reduced human error and faster deployments.

---

### 🏗 Architectural Diagram

            🌐 Internet
                │
       ┌────────┴────────┐
       │  Internet GW    │
       └────────┬────────┘
                │
        ┌───────┴───────┐
        │   Public Subnets  │
        │   NAT Gateways    │
        └───────┬───────┘
                │
       ┌────────┴────────┐
       │  Private Subnets │
       │  Applications    │
       └─────────────────┘
       
---

### ✅ Benefits
- **Resilience:** Workloads span multiple AZs, reducing downtime risk.
- **Security:** Private subnets protect sensitive resources with controlled outbound access.
- **Scalability:** Easily add subnets, AZs, or workloads without redesigning the network.
- **Operational efficiency:** Automated, modular Terraform code reduces configuration errors and speeds up deployments.

---

### ⚡ Quick Stats
- 🌍 VPC CIDR: 10.0.0.0/16
- 🔹 Public Subnets: 2
- 🔹 Private Subnets: 2
- ⚡ NAT Gateways: 2 (for HA)
- 🛠 Terraform version: >= 1.5
- ☁ AWS provider: ~>5.0

This project provides a foundation for production-grade AWS workloads, including web applications, databases, and microservices, with high availability, security, and automation built-in.
