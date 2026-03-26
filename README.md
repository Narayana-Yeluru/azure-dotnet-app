# Azure .NET Hello World App with Terraform and GitHub Actions

This repository demonstrates how to deploy a **.NET 7 Hello World application** to **Azure App Service** using **Terraform** and **GitHub Actions**.

The setup supports multiple environments (`dev`, `staging`, `prod`) with **approval gates** for staging and production deployments.

---

## Repository Structure

azure-dotnet-app/
├── .github/
│ └── workflows/
│ └── pipeline.yml # CI/CD workflow
├── terraform/
│ ├── main.tf # Terraform resources
│ ├── variables.tf # Input variables
│ ├── outputs.tf # Outputs (web app URL)
├── env/
│ └── dev.tfvars # Environment variables for dev
├── src/
│ └── HelloWorld/
│ ├── Program.cs # Hello World app
│ └── HelloWorld.csproj # .NET project file
├── README.md


---

## Prerequisites

- **Azure Account** with Contributor role
- **Existing Resource Group** and **App Service Plan**  
  Example: `dev-rg-wastus3` and `dev-appservice-plan`
- **GitHub Secrets**:
  - `AZURE_CREDENTIALS` → Service principal JSON for Terraform login
  - `AZURE_PUBLISH_PROFILE` → Publish profile of App Service for deployment

---

## How It Works

1. **Terraform**:
   - Creates an Azure Linux Web App under the existing App Service Plan.
   - Generates a random suffix for a globally unique name.

2. **GitHub Actions**:
   - **Terraform job**: validates and applies infrastructure.
   - **Deploy job**: builds and publishes the .NET Hello World app.
   - Supports **approval gates** for staging/prod environments.

3. **.NET Application**:
   - Simple Hello World web application using ASP.NET minimal API.
   - Runs on **.NET 7** in Azure App Service.

---

## Deployment Steps

### 1. Configure GitHub Secrets

- `AZURE_CREDENTIALS` → Terraform login
- `AZURE_PUBLISH_PROFILE` → App Service deployment

### 2. Update `.tfvars` files

Modify `env/dev.tfvars` for your environment:

```hcl
resource_group_name   = "dev-rg-wastus3"
app_service_plan_name = "dev-appservice-plan"
environment           = "dev"


---

## Prerequisites

- **Azure Account** with Contributor role
- **Existing Resource Group** and **App Service Plan**  
  Example: `dev-rg-wastus3` and `dev-appservice-plan`
- **GitHub Secrets**:
  - `AZURE_CREDENTIALS` → Service principal JSON for Terraform login
  - `AZURE_PUBLISH_PROFILE` → Publish profile of App Service for deployment

---

## How It Works

1. **Terraform**:
   - Creates an Azure Linux Web App under the existing App Service Plan.
   - Generates a random suffix for a globally unique name.

2. **GitHub Actions**:
   - **Terraform job**: validates and applies infrastructure.
   - **Deploy job**: builds and publishes the .NET Hello World app.
   - Supports **approval gates** for staging/prod environments.

3. **.NET Application**:
   - Simple Hello World web application using ASP.NET minimal API.
   - Runs on **.NET 7** in Azure App Service.

---

## Deployment Steps

### 1. Configure GitHub Secrets

- `AZURE_CREDENTIALS` → Terraform login
- `AZURE_PUBLISH_PROFILE` → App Service deployment

### 2. Update `.tfvars` files

Modify `env/dev.tfvars` for your environment:

```hcl
resource_group_name   = "dev-rg-wastus3"
app_service_plan_name = "dev-appservice-plan"
environment           = "dev"
