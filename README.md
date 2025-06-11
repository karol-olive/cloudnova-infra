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
Before deploy the infrascture is necessary to have an aws key access for terraform. Go in your console AWS IAM->User->Create User, keep in mind that this user shoudn't have access to the console. This user need to have admin access, so will be able to create all resources, saying that, this key is very important, so keep in a save place and implement a key rotation. 

With this values in your hand, go to repository settings, Secrets and variables->Actions->Repository secrets and create the flowing:

 - AWS_ACCESS_KEY_ID 
 - AWS_SECRET_ACCESS_KEY
 - GH_TOKEN -> Here is to keep this repository private is necessary create your PAT (Personal Access Token)

# How to Deploy
Once the secrets is created, just go to the [GitHub Action pipeline](https://github.com/karol-olive/cloudnova-infra/actions/workflows/cd.yml), and trigger manually. This repo have 3 main folders, and must be deployed in this order:

 - networking 
 - eks
 - eks-helm

I will explain each one on the section below.

# Networking: Designer

The networking was designer thinking on scalabiltiy and resilience, each main resource such as NAT Gateway and ALB will always be deployed in multi-zones, if one region goes down the application not be affected toltally. 

![Networking](https://github.com/user-attachments/assets/01ed8d4e-1528-4a28-a9ef-54152020f981)

