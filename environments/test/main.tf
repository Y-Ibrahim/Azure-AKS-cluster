# Module: Fullcluster
module "test_cluster" {
source = "../../modules/tf_module_full_cluster"
region = var.region
name   = var.cluster_name

# node pool
node_count = 2
vm_size = "Standard_B4ms"
enable_auto_scaling = true
min_count = 1
max_count = 5




















}