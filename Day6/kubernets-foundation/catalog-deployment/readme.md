kubectl apply -f catalog-deployment.yaml
kubectl get pod 
kubectl get deployment 
kubectl get rs 
![alt text](image.png)

kubectl get pod -o wide
![alt text](image-1.png)

![alt text](image-2.png)
kubectl port-forward deploy/catalog 7081:8080
![alt text](image-3.png)
![alt text](image-4.png)


![alt text](image-5.png)

![alt text](image-6.png)

kubectl scale deployment catalog --replicas=3
![alt text](image-7.png)

kubectl get pod -o wide 
![alt text](image-8.png)

kubectl scale deployment catalog replicas=1
![alt text](image-9.png)

# Rolling Update (Upgrade App Version)

![alt text](image-10.png)
kubectl rollout history deployment/catalog
![alt text](image-11.png)

# Update the Deployment image
# List Deployment Revisions
kubectl rollout history deployment/catalog
![alt text](image-12.png)

# Update the Deployment
kubectl set image deployment/catalog catalog=public.ecr.aws/aws-containers/retail-store-sample-catalog:1.3.0
![alt text](image-13.png)

# List Deployment Revisions
kubectl rollout history deployment/catalog

# Rollback to Previous Version (1.0.0)
![alt text](image-15.png)
![alt text](image-14.png)
kubectl get 
Feature	Description
Deployment	Manages Pods & ensures desired state
ReplicaSet	Keeps specified number of Pods running
Rolling Update	Gradual version upgrade with zero downtime
Rollback	Instantly revert to previous working version
Scaling	Scale Pods up/down using a single command
Probes	Keep Pods healthy & automatically restarted if needed
Security Context	Enforces least privilege and non-root execution