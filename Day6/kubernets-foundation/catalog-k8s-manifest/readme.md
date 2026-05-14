Deploy the catalog pod 
![alt text](image.png)

kubectl descripbe pod <pod-name>
![alt text](image-1.png)

# Access the Application via Port Forwarding
# Expose the Pod locally using:
kubectl port-forward pod/catalog-pod 7080:8080

# Topology Endpoint
http://localhost:7080/topology

![alt text](image-2.png)

# Health Endpoint
http://localhost:7080/health
![alt text](image-3.png)

# Catalog - Get Products
http://localhost:7080/catalog/products
![alt text](image-4.png)

# Catalog - Get Products By ID
http://localhost:7080/catalog/products/d77f9ae6-e9a8-4a3e-86bd-b72af75cbc49


# Catalog - Get Size
http://localhost:7080/catalog/size
![alt text](image-5.png)

# Catalog - Get Tags
http://localhost:7080/catalog/tags
![alt text](image-6.png)


# inside the pod 
kubectl exec -it catalog-pod -- sh
![alt text](image-7.png)

kubectl delete pod catalog-pod
![alt text](image-8.png)
