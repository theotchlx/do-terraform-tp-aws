# Cloud9 setup documentation
Author: Théo TCHILINGUIRIAN
License: None. Do whatever u want with it.

---

## Summary

1. Create an AWS sandbox environment
2. Create a Cloud9 environment
3. Download Terraform

---

## 1. Create an AWS sandbox environment

1. Create an AWS sandbox environment:
  > https://awsacademy.instructure.com/courses/70294/modules/items/6270389

2. Start the lab


## 2. Create a Cloud9 environment

1. Go to the Cloud9 service and create an environment

2. Open the Cloud9 IDE

3. Installing Terraform on the Cloud9 environment:


## 3. Install terraform

1. Install Terraform
  `wget https://releases.hashicorp.com/terraform/0.15.1/terraform_0.15.1_linux_amd64.zip`

2. Unzip terraform binaries
  `unzip terraform_0.15.1_linux_amd64.zip`

3. Add terraform to /usr/local/bin
  `sudo mv terraform /usr/local/bin`


### There you go! Well done.
### If you want to use Cloud9 as your IDE, you can add your GitHub keys to push your changes to your repo.


Code du prof :
Installation de terraform sur cloud9 :
```
tf_version=1.7.4
wget https://releases.hashicorp.com/terraform/1.7.4/terraform_1.7.4_linux_amd64.zip;
sudo unzip terraform_*_linux_amd64.zip -d /usr/local/bin;
rm terraform_*_linux_amd64.zip;
terraform --version;
```