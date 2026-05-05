# CAP Drop
all security releated capability dropping
# Cap_add (net bind service)
net bind service it means it will allow less than 1024 port
# Cap_drop(all)
 rest permission should be drop 

 Docker Compose install 
 # Create the CLI plugin directory
sudo mkdir -p /usr/local/lib/docker/cli-plugins

# Download the latest Docker Compose v2 binary (always pulls the newest release)
wget https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 -O docker-compose

# Make it executable
chmod +x docker-compose

# Move it to the CLI plugins directory
sudo mv docker-compose /usr/local/lib/docker/cli-plugins/docker-compose

# Verify install
docker compose version
![alt text](image.png)
Compose Up / Down / Logs

# Create Directory
mkdir demo-compose
cd demo-compose

# Download the Docker Compose file
wget https://github.com/aws-containers/retail-store-sample-app/releases/download/v1.3.0/docker-compose.yaml

![alt text](image-1.png)

# Set environment variable
export DB_PASSWORD='mydbkalyan101'

# Start all services
Step-03: Services Used in This Project
S.No	Application	Image
1	cart	public.ecr.aws/aws-containers/retail-store-sample-cart:1.3.0
2	carts-db	amazon/dynamodb-local:1.20.0
3	catalog	public.ecr.aws/aws-containers/retail-store-sample-catalog:1.3.0
4	catalog-db	mariadb:10.9
5	checkout	public.ecr.aws/aws-containers/retail-store-sample-checkout:1.3.0
6	checkout-redis	redis:6.0-alpine
7	orders	public.ecr.aws/aws-containers/retail-store-sample-orders:1.3.0
8	orders-db	postgres:16.1
9	rabbitmq	rabbitmq:3-management
10	ui	public.ecr.aws/aws-containers/retail-store-sample-ui:1.3.0

used service list 
![alt text](image-2.png)

## Important Note:  if your file name is docker-compose.yaml dont need to specify -f with file
docker compose -f docker-compose.yaml up
docker compose up 
![alt text](image-3.png)

# OR start in detached mode (background)
docker compose -f docker-compose.yaml up -d
using below command
docker compose up 
![alt text](image-4.png)

docker compose up -d

![alt text](image-6.png)

# Stop all services (gracefully) (NOT NEEDED NOW - JUST FOR REFERENCE)
docker compose down
![alt text](image-5.png)
Output on browser 
http://<EC2-Instance-Public-IP>:8888
![alt text](image-7.png)
http://<EC2-Instance-Public-IP>:8888/topology

![alt text](image-8.png)


Usful docker compose command 
![alt text](image-9.png)
# List Services 
docker compose ps

# Also verify Docker images it downloaed
docker images
Stop and start single service
# Stop a Service
docker compose stop orders
![alt text](image-11.png)

# Verify if service is stopped
docker compose ps
docker compose ps -a

# Start a Service
docker compose start orders
![alt text](image-10.png)
![alt text](image-12.png)
Restart a Service 
# Restart a Service
docker compose restart cart

# Verify if service restarted
docker compose ps

# View Logs
# Logs for all services
docker compose logs

# Logs for a specific service
docker compose logs checkout

# Follow logs
docker compose logs -f checkout

UI logs 
docker compose ui logs
![alt text](image-13.png)

 Run Commands Inside a Container
 # Connect to a Container
docker compose exec ui sh

# Commands to run in container
ls
id
uname -m
uname -n
env
cat /etc/hostname
cat /etc/os-release 
cat /etc/os-release | sed -n '1,6p' 
curl http://localhost:8080
curl http://localhost:8080/topology
curl http://localhost:8080/actuator/health
exit


Docker Compose Stats
# Stats 
docker compose stats
![alt text](image-14.png)
# Specific Containers
docker compose stats ui
![alt text](image-15.png)
Display the running process in a container
# Display the running process of all service containers
docker compose top

# Specific containers
docker compose top ui
docker compose top checkout

UI App: Make changes to Docker Compose and Deploy
![alt text](image-16.png)

docker command to stop and start the ui
![alt text](image-17.png)

Force recreate UI Container
# Stop All Services
docker compose up -d --force-recreate ui

[or]

# Stop All Services
docker compose down 

# Start All Services
docker compose up -d

![alt text](image-18.png)
 # using command 
docker compose up -d --force-recreate ui

![alt text](image-19.png)

allow port in my security group
![alt text](image-20.png)
