## Terraform module for GKE with custom buckets

To be able to use following terraform module please follow the documentation. 


## Requirements

* Terraform >= 0.11.14
* provider.google: version = "~> 2.20"
* Create Service account with necessary permissions on GCP and download Json file



## Calling module

Your `cluster.tfvars` should look like this
```
google_project_id        = "oval-turbine-304720"
google_domain_name       = "vladlen-aws.com"
cluster_version          = "1.15"
google_bucket_name       = "vladlen-gke-2021"
deployment_environment   = "dev"
google_credentials_json  = "service-account.json"
deployment_name          = "deployment-name"
google_region            = "us-central1-a"
cluster_name             = "cluster-1"
cluster_node_count       = 2
```

After you finish with defining all required variables go ahead and run `source set-env.sh cluster.tfvars`
Make sure you Create Bucket with the name you provided in tfvars file

```
source set-env.sh cluster.tfvars
```

After terraform finish with initialization go ahead and apply 
```
terraform apply -var-file cluster.tfvars

```