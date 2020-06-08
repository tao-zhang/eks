# Jenkins As Code

The goal of this project is to create a usable Jenkins instance via version controlled code. This will need several tools and Jenkins plugins to work together.

## EKS

Jenkins instance runs in Kubernetes, the code of Kubernetes is achieved by Terraform.

## Jenkins

[Helm chart Jenkins](https://github.com/helm/charts/tree/master/stable/jenkins) is used to deploy Jenkins into Kubernetes and configure Jenkins as code, via chart [values.yaml](https://github.com/tao-zhang/eks/blob/master/helm/jenkins/values.yaml).

## Jenkins credentials

This is achieved by Jenkins plugin [Kubernetes credentials provider](https://plugins.jenkins.io/kubernetes-credentials-provider/). The credentials are saved in Kubernetes directly as Secret, and this plugin will load these secrets as Jenkins credentials.

Some example credential YAML files can be found in `k8s-credentials-provider`. The credentials can be created in Kubernetes by running `kubectl create -f k8s-credentials-provider`.

## Jenkins jobs

This is achieved by Jenkins plugin [Job DSL](https://plugins.jenkins.io/job-dsl/), more information can be found at [here](https://github.com/tao-zhang/jenkins-dsl-jobs).

