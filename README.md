# She Code Africa Cloud School FINAL PROJECT

## Running Django on Google Kubernetes Engine

I will be using Terraform and Travis CI to deploy this app and set up a CI/CD pipeline

[Link to Terraform Repository](https://github.com/Thandiwe-khalaki/django_app


### Before you begin

Make sure that billing is enabled for your Cloud project. Learn how to confirm that billing is enabled for your project and enable the Cloud SQL, and Compute Engine APIs.


###Set up your local enviroment 

1. Download and install the Cloud SQL Proxy. The Cloud SQL Proxy connects to your Cloud SQL instance when running locally.

```
wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -O cloud_sql_proxynode app.js
chmod +x cloud_sql_proxy
```
2. Creating a Cloud SQL instance
[Link to Terraform Repository](https://cloud.google.com/sql/docs/postgres/create-instance)

3.Use the Cloud SDK to run the following command where [YOUR_INSTANCE_NAME] represents the name of your Cloud SQL instance:

```
./cloud_sql_proxy -instances="[YOUR_INSTANCE_CONNECTION_NAME]"=tcp:5432
```
Replace [YOUR_INSTANCE_CONNECTION_NAME] with the [CONNECTION_NAME] value that you recorded in the previous step.

This step establishes a connection from your local computer to your Cloud SQL instance for local testing purposes. Keep the Cloud SQL Proxy running the entire time you test your app locally.
3. Create a Cloud SQL user and database

[Link to Terraform Repository](https://cloud.google.com/sql/docs/postgres/create-manage-databases#create)

## Creating a service account
[Link to Terraform Repository](https://cloud.google.com/iam/docs/creating-managing-service-accounts)

### Configuring the database settings

1. Use the following commands to set environment variables for database access. These environment variables are used for local testing
Linux

```
export DATABASE_USER=<your-database-user>
export DATABASE_PASSWORD=<your-database-password>
```

Windows 

```
set DATABASE_USER=<your-database-user>
set DATABASE_PASSWORD=<your-database-password>
```

### Setting up your GKE configuration

1. This application is represented in a single Kubernetes configuration, called polls. In polls.yaml replace <your-project-id> with your Google Cloud project ID.
2. Run the following command and note the value of connectionName:
```
  gcloud beta sql instances describe [YOUR_INSTANCE_NAME]
```
3. In the polls.yaml file, replace <your-cloudsql-connection-string> with the connectionName value.

### Running the app on your local computer

1. To run the Django app on your local computer, set up a Python development environment, including Python, pip, and virtualenv.
2. Create an isolated Python environment and install dependencies. If your Python 3 installation has a different name, use that in the first command:
```
virtualenv env
source env/bin/activate
pip install -r requirements.txt
```
3. Run the Django migrations to set up your models:
```
python manage.py makemigrations
python manage.py makemigrations polls
python manage.py migrate

```
4. Start a local web server:
```
python manage.py runserver
```
Press Control+C to stop the local web server.

### Using the Django admin console

1. Create a superuser. You need to specify a username and password.
```
python manage.py createsuperuser
```
2. Run the main program:
```
python manage.py runserver

```
3. In your browser, go to http://localhost:8000/admin.
4. Log in to the admin site using the username and password you used when you ran createsuperuser

### Containerising The Application

1. The Dockerfile is at the root of the project
``` 
docker build -t gcr.io/<your-project-id>/polls .

```
2. Retrieve the public Docker image for the Cloud SQL proxy.
```
Retrieve the public Docker image for the Cloud SQL proxy.
```
3. Retrieve the public Docker image for the Cloud SQL proxy.

```
docker pull b.gcr.io/cloudsql-docker/gce-proxy

```
4. Configure Docker to use gcloud as a credential helper, so that you can push the image to Container Registry:

```
gcloud auth configure-docker

```
5. Push the Docker image. Replace <your-project-id> with your project ID.

```
Push the Docker image. Replace <your-project-id> with your project ID.
```
### Use Terraform 

1. Create a main.tf file for the main resources and modules

https://github.com/Thandiwe-Khalaki/django_app/blob/master/main.tf

2. Create a database.tf file. a database terraform file is for the modules ad resources of the database

https://github.com/Thandiwe-Khalaki/django_app/blob/master/database.tf

3. Create an output.tf. This file holds the output variables from the main and database resources and modules.

https://github.com/Thandiwe-Khalaki/django_app/blob/master/output.tf

4. Create a variables.tf file. This serves as parametes for terraform modules ad resources.

```
https://github.com/Thandiwe-Khalaki/django_app/blob/master/output.tf
```
5. Create a variables.tfvars. This file serves values to varible.tf

### Run Terraform

After setting the above mentioned files, run the following commands
1. This command initializes the enviroment
``` terraform init```
2. This command is for terraform the save its project plan out a file terraform.tfplan
``` terraform plan out terraform.tfplan ```
3. This command is for terraform to aplly the plan 
``` terraform apply "terraform.tfplan"```

Access your cluster external ip address through your gcp console

### Set Up TravisCI

https://travis-ci.org/getting_started

1. Sign in with your Github account
2. Select your repository
3. Create a .travis.yml file in the root of your repository
4. Set up a simple CI/CD pipleine

https://github.com/Thandiwe-Khalaki/django_app/blob/master/.travis.yml

### References 

1. Django project https://cloud.google.com/python/django/kubernetes-engine#set_up_cloud_sql
2. Terraform https://www.terraform.io/
3. TravisCI https://docs.travis-ci.com/



