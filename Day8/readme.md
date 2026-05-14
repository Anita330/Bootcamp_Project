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


# kube-apiserver 
The core component server that expose the kubernets HTTP API 
# ETCD
consitent and highly available key value store for all api servre 
# kube-schuduler 
looks for pods not yet bound to a node, and assign each pod to a node 
# kube-controller-manager


# AWS secrete

aws secretsmanager create-secret \
  --name catalog-db-secret-10 \
  --region $AWS_REGION \
  --description "MySQL credentials for Catalog microservice" \
  --secret-string '{
      "MYSQL_USER": "mydbadmin",
      "MYSQL_PASSWORD": "kalyandb101"
  }'

  aws secretsmanager list-secrets --region $AWS_REGION --query "SecretList[?contains(Name, 'catalog-db-secret-10')].[Name,ARN]" --output table

  # Retrieve Secret Value (for testing only)
aws secretsmanager get-secret-value \
  --secret-id catalog-db-secret-10 \
  --region $AWS_REGION \
  --query SecretString --output text


# MySQL Pod
kubectl exec -it <mysql-pod-name> -- ls /mnt/secrets-store
kubectl exec -it <mysql-pod-name> -- cat /mnt/secrets-store/MYSQL_USER
kubectl exec -it <mysql-pod-name> -- cat /mnt/secrets-store/MYSQL_PASSWORD


# Catalog Pod
kubectl exec -it <catalog-pod-name> -- ls /mnt/secrets-store
kubectl exec -it <catalog-pod-name> -- cat /mnt/secrets-store/MYSQL_USER
kubectl exec -it <catalog-pod-name> -- cat /mnt/secrets-store/MYSQL_PASSWORD


![alt text](image-10.png)
![alt text](image-11.png)
![alt text](image-12.png)
![alt text](image-13.png)
![alt text](image-14.png)
![alt text](image-15.png)


# Connect to MySQL Database using MySQL Client Pod
kubectl run mysql-client --rm -it \
  --image=mysql:8.0 \
  --restart=Never \
  -- mysql -h catalog-mysql -u mydbadmin -p


SHOW DATABASES;
USE catalogdb;
SHOW TABLES;
SELECT * FROM products;
![alt text](image-17.png)
SELECT * FROM tags;
![alt text](image-16.png)
SELECT * FROM product_tags;
![alt text](image-18.png)
EXIT;