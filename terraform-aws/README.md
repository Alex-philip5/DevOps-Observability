# terraform-aws
Terraform AWS EC2 provisioning 

## Hit the Star! ⭐
If you are planning to use this Terraform repo for learning, please hit the star. Thanks!

## EC2 Instance Provisioning

1. Navigate to the `environment/dev/ec2` folder:

```bash
cd environment/dev/ec2
```

2. Open the `ec2.tfvars` file and modify it with your desired details. This file contains variables used in the Terraform configuration.

### Deployment

1. Initialize Terraform in the working directory:

```bash
terraform init
```

2. Create an execution plan:

```bash
terraform plan -var-file=../../../vars/dev/ec2.tfvars
```

3. Apply the changes to create the EC2 instance:

```bash
terraform apply -var-file=../../../vars/dev/ec2.tfvars
```

4. To destroy the EC2 instance and associated resources:

```bash
terraform destroy -var-file=../../../vars/dev/ec2.tfvars
```

**Note**: Always review the execution plan (`terraform plan`) before applying changes to avoid unintended modifications.


## Terraform Command Reference

Update all outputs:

<pre>terraform refresh</pre>

Show all outputs:

<pre>terraform show</pre>



