# Introduction
This page documents pre-reqs and steps before you can provision Mysql RDS thru pipod.

## Requirements
1. Terraform version >= 1.4.6
3. Internet gateway
4. Two public subnets
Note:- vpc, igw and subnets should be at same region where RDS is going to deploy

### VPC
You can use a existing vpc or create new one using following steps. Ensure that you have sufficient ip addresses in the vpc.

1. Login to aws console 
2. Search for VPC
3. Click on create VPC
4. Select
    - Resources to create :- vpc only 
    - Name Tag :- Give meaningful name (for example:- "vpc-pipod-resources")
    - IPv4 CIDR block :- IPv4 CIDR manual input
    - IPv4 CIDR :- (for example :- "192.168.0.0/16")
    - No IPv6 CIDR block 
    - Create vpc 

### Internet gateway
Use the below steps to create an internet gateway if you choose to create a new vpc.

1. Search for VPC 
2. Click on internet gateways 
3. Click on create internet gateway
4. Add details
    - Name tag :- Give meaningful name (for example:- "igw-pipod")
    - Click on create 
    - From list of Internet Gateways, click on your internet gateway
    - From actions select "Attach to vpc"
    - From available vpc select your vpc and click on attach internet gateway

### Subnets
You should have atleast 2 private or public subnets depending on cluster private access or public access. Use the below steps to create subnets.

#### Subnet-1

1. From VPC select subnets
2. Click on create subnet 
    - vpc id :- Select newly created vpc 
    - Subnet name :- "snet-public-a-pipod"
    - Availability Zone :- (for example:- us-east-1a) 
    - IPv4 CIDR block :- (for example :- "192.168.0.0/24")
3. Click on `Add new subnet` to add another subnet
    - vpc id :- Select newly created vpc 
    - Subnet name :- "snet-public-b-pipod"
    - Availability Zone :- (for example:- us-east-1b) 
    - IPv4 CIDR block :- (for example :- "192.168.1.0/24")
4. Click on create subnet
Note:-Availablity zone and IPv4 CIDR block should be different for both the subnets

5. Enable auto-assign public IPv4 address
    - From list of subnets open subnet you have just created 
    - From "actions" select "edit subnet settings"
    - From Auto-assign IP settings,select checkbox for Enable auto-assign public IPv4 address and  save
Note:- Repeat step 5 for both subnets

### Route table
You need to setup appripriate route entries in the route table as explained below.

1. From VPC, Select Route tables
2. From list of Route tables, click on Route table id which is attached to your vpc. (you can also access the route table from details of your vpc)
3. From routes section click on edit routes
4. Add route 
  - Destination :- "0.0.0.0/0"
  - Target :- Internet Gateway and select newly created Internet Gateway 
  - Save changes
5. From Subnet associations, click on edit subnet associations from Explicit subnet associations
    - Select both subnets which are newly created
    - Save associations

## PiPOD onboarding
After Completing all the steps, onboard account in pipod using above vpc id and subnet ids. 

<hr>

## How to create RDS Mysql cluster without pipod

Make a copy of modules\custom\aws_rds_mysql folder at the root level of pipod_provisioning.

2. Create a new file .rds.auto.tfvars with following contents

vpc_id            = "<vpc id>"
public_subnet_ids = ["<subnet id 1>", "<subnet id 2>"]
rds_name      = "<rds name>"
```
3. Create a folder `.aws`. Create `credentials` file under this folder as follows
```
[default]
aws_access_key_id = <access key>
aws_secret_access_key = <secret key>
```
4. Run following commands in sequence
```
terraform init
terraform plan -out autocloud.tfplan
terraform apply --auto-approve autocloud.tfplan
```
5. Review the command output until RDS is created successfully,
6. Once done, delete the cluster
```
terraform destroy
```

Note: Terraform state is stored locally. Please ensure that you run `terraform destroy` after your work is done
