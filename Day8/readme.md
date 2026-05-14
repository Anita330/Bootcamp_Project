pod identity
![alt text](image.png)

![alt text](image-1.png)

kubectl get svc
kubectl get secret
![alt text](image-2.png)

kubectl describe secret catalog-db
![alt text](image-3.png)

kubectl get secret catalog-db -o yaml
![alt text](image-4.png)

kubectl port-forword svc/catalog-service 7080:8080
![alt text](image-5.png)

![alt text](image-6.png)

![alt text](image-7.png)

![alt text](image-8.png)

![alt text](image-9.png)

Concept	Description
ConfigMap	Stores non-sensitive data (configurations).
Secret	Stores sensitive data securely (credentials, tokens).
envFrom	Loads ConfigMap and Secret into Pod environment.
Security	Base64 encoding + restricted visibility in kubectl get output.
