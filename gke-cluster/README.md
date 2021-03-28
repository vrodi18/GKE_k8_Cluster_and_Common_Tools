## Terraform module for GKE with custom buckets

To be able to use following terraform module please follow the documentation. 


## Requirements

* Terraform >= 0.11.14
* provider.google: version = "~> 2.20"



## Calling module

Your `main.tf` should look like this
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

After you finish with defining all required variables go ahead and run `terraform init`

```
terraform init
```

After terraform finish with initialization go ahead and apply 

## Variables

For more info, please see the [variables file](?tab=inputs).

| Variable               | Description                         | Default                                               | Type |
| :--------------------- | :---------------------------------- | :---------------------------------------------------: | :--------------------: |
| `google_project_id` | Google account project id | `(Required)` | `string` |
| `google_region` | Name of the namespace | `(Required)` | `string` |
| `cluster_version` | Version of the cluster. | `(Required)` | `string` |
| `cluster_node_count` | Number of nodes for the cluster. | `(Required)` | `string` |
| `google_credentials` | your google service account `example.json`| `(Required)` | `string` |
| `cluster_network` |The name or self_link of the Google Compute Engine network to which the cluster is connected. | `(Optional)` | `string` |
| `cluster_name` | The name of the cluster, unique within the project and location. | `(Required)` | `string` |
| `machine_type` | The name of a Google Compute Engine machine type. | `(Optional)` | `string` |
| image_type     | The disk side of each node in the cluster         |  `(Optional)`| `string`  |  
