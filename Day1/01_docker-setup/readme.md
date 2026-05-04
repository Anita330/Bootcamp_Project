# Bootcamp_Project
Docker install in ec2 server command
sudo dnf update -y
sudo dnf install docker -y
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker ec2-user

![alt text](image.png)
#Test docker 
![alt text](image-1.png)
#run the docker container 
docker run hello-world
![alt text](image-2.png)
#check the images 
we can see the stopped contaion using below command
docker ps -a
![alt text](image-3.png)
remove the stopped container
docker rm $(docker ps -aq)

