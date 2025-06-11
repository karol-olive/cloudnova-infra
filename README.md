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
After creating the secrets, simply access the [GitHub Actions pipeline](https://github.com/karol-olive/cloudnova-infra/actions/workflows/cd.yml) and trigger them manually. This repository has 3 main folders each one has your own terraform state and should be deployed in this order:

- networking
- eks
- eks-helm

I will explain each of them in the sections below.

# Networking

## Designer
The networking was designer thinking on scalabiltiy and resilience, each main resource such as NAT Gateway and ALB will be deployed in multi-zones, if one region goes down the application not be affected toltally. Also there is a dedicate range ip to the pod's, keep them segregate to the range to the other networking resources.

![Networking](https://github.com/user-attachments/assets/01ed8d4e-1528-4a28-a9ef-54152020f981)


## Security
The subnets was segregated by public, private, pods and databases. The database one for example can just recive request from the private subnet in a specific port, for that I use the NACL;s, just for give a example you can consult [here](https://github.com/karol-olive/cloudnova-infra/blob/main/networking/environment/prod/terraform.tfvars#L84). Keep in mind that can be update or create to other ports as well, the terraform is prepared to hande with that.

# EKS

## Designer
The EKS module deploys the EKS resource with Node Group and Karpenter, also an ALB. You can deploy as many nodepools as you need, just by incrementing the block [here](https://github.com/karol-olive/cloudnova-infra/blob/main/eks/environment/prod/terraform.tfvars#L39). With this strategy, is creating high availability and resilience for the application. Keep in mind that the application also needs to reflect those changes. To validate the scenario, there is this application call chip, which already configures some options for different nodepools and exposes it to the internet through ALB resources. You can see it [here](https://github.com/karol-olive/cloudnova-infra/blob/main/app/chip.yml).

## Security
To deploy resources within EKS, create a role for each service and use the least privilege strategy. For each resource, there is an iam_<service>.tf that contains the required permission. Keep in mind that for new resources, you need to create the corresponding iam. You can find it [here](https://github.com/karol-olive/cn-eks)

# EKS-Helm

This folder contains any extra helm needed to manage or get metrics from the cluster, this way the resources that have most changes and/or continue improvement has a Terraform state segregated from the main infrastructure, keeping management simple and avoiding read long terrafrom plan or deleting any important resource ;).

# Deployments (to be implemented)

Rollout is a very powerful tool in the ArgoCD stack that allows us to deploy our application with different strategies, such as Canary and Blue/Green.

The key word when we talk about the Canary strategy is **gradually**, which means that we will have two versions of our application deployed, but only a percentage of the requests will be redirected to the new one. The Rollout tool allows us to define this promotion by time or after some metrics are available, approving manually or automatically.

However, when we talk about the Blue/Green strategy, we will have a new version, the green one, in our environment and a new service, but all the traffic remains on the blue (stable) version until all the tests, on the new green version, are completed. We can use smoke tests, warmups and so on, the Rollout tool allows us to create these scenarios too. The main difference here is that, once the green version is tested, we promote all the requests to it and keep the blue (old) version for a while, in case we need any rollback.
