# Terraform remote state locking 
![alt text](image.png)

![alt text](image-1.png)

# Why Use Remote Backend?
1. Team Collaboration: Prevent state conflicts when multiple people run Terraform.
2. State Locking: Avoids race conditions using DynamoDB.
3. Durability: S3 ensures highly available and persistent state storage.