# GCP-Final-Task 
Deploy a python web application on GKE. Infrastructure built using terraform. Using docker to containerize the application.

## Build image and upload to GCR
```
docker build -t <img-name> .
docker tag <img-name> gcr.io/<project-id>/<img-name>
docker push gcr.io/<project-id>/<img-name>
```
## Build infrastructure on GCP
```
cd infra/
terraform init
terraform apply
```
## Connect to private GKE cluster through private vm
```
gcloud compute ssh management-instance --tunnel-through-iap
gcloud container clusters get-credentials private-cluster --zone us-central1-a
```
## Deploy app to GKE cluster and expose deploymnet through load balancer
```
kubectl apply -f deploys
```
## Connect using load balancer public IP
![Screenshot from 2022-05-09 00-51-58](https://user-images.githubusercontent.com/31425172/167319303-b08b3b72-88b1-473c-9d6a-7300d3d5676c.png)
