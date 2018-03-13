                       Terraform template to provision Cassandra cluster on Azure


Setup you private Azure creds before running the template:
you can do that by giving this command: az ad sp create-for-rbac --name ServicePrincipalName --password "Enter any password" in Azure CLI
subscription_id 	= "insert subscription id"
tenant_id           = "insert tenant id"
client_id             = "insert client id" #which is app id when you give above command
client_secret     = "insert client_secret key" # which is password when you give the above command

Process to initialize the scripts
1. Create storage account, container and get the access key and place them for remote state file at the end of main.tf file.
Run these commands to run & test Terraform script:
2.	terraform init (To initialize the project)
3.	terraform plan (To check the changes to be made by Terraform template)
4.	terraform apply (To apply the changes)
5.	terraform show (To view all the steps performed when terraform apply)
To verify whether cassandra cluster is properly created, ssh to the azure vm created by template, and give the following command:
    sudo nodetool status
You can also connect to the cassandra cluster through the cassandra command line interface: cqlsh


The remote state file is stored in the azure blob storage that I used as a backend storage service.
1.	Backend state file is stored on your Azure storage container which I cretaed and mentioned those details in the template.

                      Ansible playbook to reset opscenter UI  default password for admin user

Install ansible and required dependencies and configure.

Create a <filename>.yml file to deploy ansible playbook to reset OpsCenter admin password

create a inventory file to mention all the servers in which you want to deploy the playbook

Then to build the image do the following:

Run playbook "ansible-playbook <filename>.yml -i inventory -vvv"

Then the admin password for the Opscenter will be changed accordingly, to test it just enter the following in the browser,
  https://<public_IP>:8888
  Then you will see the UI for the Opscenter asking for Login credentials.
