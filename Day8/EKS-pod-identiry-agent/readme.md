![alt text](image.png)

kubectl get daemonset -n kube-systen
![alt text](image-1.png)

kubectl exec -it aws-cli -- aws s3 ls
![alt text](image-2.png)

# EKS Auth API Validates Association

The API checks the Pod Identity Association (Namespace + ServiceAccount → IAM Role).
If valid, it returns temporary IAM credentials back to the Pod Identity Agent.

# 