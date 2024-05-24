# ArgoCD Installation with Terraform

This repository contains Terraform configuration files to automate the installation of ArgoCD on a Kubernetes cluster.

## Prerequisites

Before using this Terraform configuration, make sure you have the following prerequisites:

- Kubernetes cluster up and running
- `kubectl` configured to connect to your Kubernetes cluster
- Terraform installed on your local machine

## Usage

Follow these steps to install ArgoCD on your Kubernetes cluster:

1. Clone this repository to your local machine.
2. Update the variables in `terraform.tfvars` file with your desired configurations.
3. Run `terraform init` to initialize the Terraform configuration.
4. Run `terraform apply` to apply the changes and install ArgoCD.
5. After the installation completes, access ArgoCD using the provided NodePort or LoadBalancer IP.

## Configuration

- `argocd_k8s_namespace`: Namespace where ArgoCD will be installed.
- Add any additional configuration variables here if needed.
- Default user name is `admin` 
- Password can be fetched by using this command : `kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo`
## Resources

This Terraform configuration creates the following Kubernetes resources:

- Namespace for ArgoCD installation.
- Deployment and associated resources for ArgoCD.
- Service of type NodePort for accessing ArgoCD UI externally.

## Cleanup

To remove ArgoCD installation, run `terraform destroy`. Make sure to take necessary backups before destroying the resources.


