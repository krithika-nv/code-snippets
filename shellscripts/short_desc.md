# Fast deployment in k8s, especially useful in MLOps

Assuming that ypur infrastructure is made of AWS, Bitbucket, Kubernetes, Helm and ArgoCD connected to your repos.

The shellscript snippet is an idea for faster deployment by directly modifying the git repo yaml file. Each update would be pulled by ArgoCD.

In case of configmap content changes, k8s wouldn't trigger a redeployment. Hence, we would manually trigger it using checksum changes in configmap file. checksum-deployment.yaml is a snippet of the deployment.yaml template which is self explanatory of the described process.
