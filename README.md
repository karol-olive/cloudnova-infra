# CloudNova Infra

This is the central repository used to provision the fictional CloudNova project. The modules used are:

 - [Networking](https://github.com/karol-olive/cn-networking)
 - [EKS](https://github.com/karol-olive/cn-eks)

This project use these tecnologys:

 - AWS as cloud provider
 - GitHubActions to handle with CI/CD
 - EKS to host the applications
 - Karpenter to handle with auto scale
 - ALB (AWS LoadBalancer ) to expos the application out of the cluster.

# Before to Deploy
Before deploying the infrastructure, you need to have an AWS access key for Terraform. Go to your AWS IAM console->User->Create User. Keep in mind that this user should not have access to the console, they need to have administrator access, so they can create all resources. However, this key is very important, so keep it in a safe place and implement key rotation.

With these values ​​in hand, go to the repository settings, Secrets and Variables->Actions->Repository Secrets and create the following secrets:

 - AWS_ACCESS_KEY_ID 
 - AWS_SECRET_ACCESS_KEY
 - GH_TOKEN -> Here is to keep this repository private is necessary create your PAT (Personal Access Token)

# How to Deploy
After creating the secrets, simply access the [GitHub Actions pipeline](https://github.com/karol-olive/cloudnova-infra/actions/workflows/cd.yml) and trigger them manually. This repository has 3 main folders and should be deployed in this order:

- networking
- eks
- eks-helm

I will explain each of them in the sections below.

# Networking: Designer

The networking was designer thinking on scalabiltiy and resilience, each main resource such as NAT Gateway and ALB will be deployed in multi-zones, if one region goes down the application not be affected toltally. Also there is a dedicate range ip to the pod's, keep them segregate to the range to the other networking resources.

![Networking](https://github.com/user-attachments/assets/01ed8d4e-1528-4a28-a9ef-54152020f981)

