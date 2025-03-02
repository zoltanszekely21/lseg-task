<h1 align="center"><img src="/assets/lseg.png" alt="LSEG" width=380 height=180></h1>

<h2 align="center">3-Tier Architecture in <a href="https://azure.microsoft.com/en-us" target="_blank"> Microsoft Azure</a> with <a href="https://developer.hashicorp.com/well-architected-framework" target="_blank"> Terraform.</h2>

## Project Summary: Deploying a Python Web App on Azure using Terraform & GitHub Actions

This project automates the deployment of a Python web application to Azure App Service using Terraform for infrastructure provisioning and GitHub Actions for CI/CD. It follows a modularized 3-tier architecture with:

● Networking Layer: Virtual Network (VNet), Subnets, and Network Security Groups (NSGs).

● Data Layer: PostgreSQL Flexible Server (Managed Database).

● Application Layer: Dockerized Python App hosted on Azure App Service. This <a href="https://github.com/Azure-Samples/python-docs-hello-world" target="_blank"> simple Python app, available in the Azure-Samples repo</a> was used as source code.


## [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

The Azure Well-Architected Framework helps us understand the pros and cons of decisions we make while building systems on Azure. It presents architectural best practices for designing and operating reliable, secure, efficient, and cost-effective systems in the cloud.

## Key Components:

#### Infrastructure as Code (Terraform)
● Modularized Terraform Code:

    networking/ → Defines VNet, Subnets, NSGs. 
    database/ → Deploys PostgreSQL Flexible Server.
    acr/ → Creates Azure Container Registry (ACR) for Docker images.
    appservice/ → Deploys Azure App Service with a Docker container.
● Remote Terraform State Storage in Azure Blob Storage.

#### CI/CD Pipeline (GitHub Actions)
● Terraform Workflow:

    Initializes Terraform (terraform init).
    Checks & unlocks Terraform state (terraform force-unlock).
    Validates (terraform validate), plans (terraform plan), and applies (terraform apply).
    
● Docker Workflow:

    Builds & pushes Docker Image to Azure Container Registry.
    Deploys latest image to Azure App Service.

#### Networking & Security
● VNet with separate App Subnet & Database Subnet.

● NSGs to restrict PostgreSQL access to App Service only.

#### Error Handling & Optimizations
● State Lock Handling: Auto-unlocks Terraform state if locked.

● Retry Mechanism: Terraform retries deployment if state lock or API failure occurs.

● Timeout Handling: Prevents PostgreSQL from causing indefinite hangs.



## UML Diagram

<h1 align="center"><img src="/assets/UML.png" alt="UML" ></h1>

## Sample Deployment Screenshots

<h1 align="center"><img src="/assets/flow.png" ></h1>

<h1 align="center"><img src="/assets/app-rg.png" ></h1>

<h1 align="center"><img src="/assets/tf-rg.png" ></h1>

## Future architectural improvements for this project:
- Replace hardcoded service principal credentials with Azure Managed Identities for secure authentication between services.
- Store PostgreSQL credentials and ACR access keys in Azure Key Vault or Hashicorp Vault, instead of GitHub Secrets.
- Restrict App Service to only allow traffic from approved sources.
- Configure Autoscaling rules for App Service based on CPU usage & memory load.
- Optimize Docker images by using multi-stage builds to create smaller, faster container images.
- Enable Blue-Green Deployment for Zero Downtime: Deploy new App Service instances alongside existing ones and swap traffic once verified.
- Integrate lower Non-Production environments for greate code quality control: Dev, Integration, QA, Regression
- Implement automated Terraform testing using Terratest to test modules before deployment.
- Implement Prometheus to collect custom application metrics.
- Migrate to Kubernetes (AKS) instead of App Service for greater scalability and container orchestration.
- Multi-region deployment for high availability: Deploy PostgreSQL and App Service across multiple Azure regions for disaster recovery.


