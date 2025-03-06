# Bistec_assessment
Create AKS cluster using terraform and deploy nginx application.

## Prerequisites
1.Access for Azure account<br/>
2.Install Azure CLI and Confirm using 
```bash
az version
```
3.Install Terraform and Confirm using 
```bash
terraform version
```
4.Install kubectl and Confirm using 
```bash
kubectl version
```



## File Structure
- `terraform/`:
  - `provider.tf`: Azure provider config.
  - `resource_group.tf`: Resource group.
  - `main.tf`: AKS cluster.
  - `outputs.tf`: Kubeconfig and status outputs.
  - `variables.tf`: Variable definitions.
- `kubernetes/`:
  - `deployment.yaml`: Nginx deployment.
  - `service.yaml`: Nginx LoadBalancer service.
- `.gitignore`
- `README.md`

***You can add all configurations in the main.tf, but for best practices, I use separate files and use variables.***

## Steps to Set Up the AKS Cluster
1. **Log in**<br/>
Need to Log in to the azure account.
```bash
az login
```

2. **Configure the service provider**<br/>
You need to add the service provider and subscription ID in the provider.tf. For security purposes, you can set the subscription ID through PowerShell instead of hardcoding it in Terraform files using

```bash
$env:ARM_SUBSCRIPTION_ID = "Subscription ID"
echo $env:ARM_SUBSCRIPTION_ID
```

3. **Configure the variable.tf**<br/>
Using variables in Terraform makes things more secure, flexible, and reusable by keeping sensitive info safe, avoiding hardcoded values, and making it easier to update settings.

4. **Configure the resorce_group.tf**<br/>
A resource group in Azure is like a folder that holds and organizes your services. You need it to manage resources easily and control access.

5. **Configure the main.tf**<br/>
The main.tf file in Terraform is used to define your infrastructure resources like virtual machines, networks, and Kubernetes clusters. It's where you write the core configuration that Terraform uses to create and manage resources.<br/>
In my case im defined azurerm_kubernetes_cluster.<br/>
You can get code blocks on Terraform DOCS.<br/>
<br/>
*special points ---->*<br/>
    If network_profile is not defined, kubenet profile will be used by default.<br/>
    identity = SystemAssigned covers the relevant cluster permissions.

6. **Configure the output.tf**<br/>
The outputs.tf file in Terraform is used to define the values you want to display after your infrastructure is created.

7. **Apply Infrastructure**<br/>
Before applying Infrastructure , need to Initialize and check using plan,<br/>
```bash
terraform init
terraform plan 
```
Make sure your in the correct directiory.<br/>

Then u can apply Infrastructure.

```bash
terraform apply 
```
Then can See Massege and Outputs. : Apply complete!

## Connect Cluster and Deploy Application

1. **Connect to the Cluster**<br/>
Before deploying application , need to connect to the cluster using 
```bash
az aks get-credentials --resource-group $MY_RESOURCE_GROUP_NAME --name $MY_AKS_CLUSTER_NAME
```
In my case
```bash
az aks get-credentials --resource-group bistec-rg --name bistec-cluster
```

2. **Verify the connection**<br/>
You can verify the connection using 
```bash
kubectl get nodes
```
The output would be the nodes that you created.<br/>
Make sure that you installed kubectl first.<br>

3. **Make relevant Deployment files**<br/>
In my case Im deploying nginx application with 2 replicas and Load Balancer Service. (deployment.yaml , service.yaml)<br/>
Code Blocks available on official docs.


4. **Deploy Application**<br/>
After createing manifest files you can deploy using 

```bash
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```
Make sure your in the correct directiory.

5. **Verify Deployment**<br/>
After deployment , can verift it using
```bash
kubectl get pods     or     kubectl get all 
```
After that you can verify it.

6. **Test the Application**<br/>

Find the Load balancer < EXTERNAL-IP ><br/>

Can access to the application using
```bash
curl http://<EXTERNAL-IP>    or     Copy and paste ip address in the broswer.
```
In my Case , you can get access using 

```bash
http://132.164.45.220/
```