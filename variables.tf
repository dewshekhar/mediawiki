locals {
    app_name = "MEDIA-WIKI"
    pub_sub_cidr_1 = "10.0.0.0/24"
    pub_sub_cidr_2 = "10.0.1.0/24"
    pri_sub_cidr_1 = "10.0.50.0/24"
    pri_sub_cidr_2 = "10.0.51.0/24"
    vpc_cidr       = "10.0.0.0/16"
    PATH_TO_PUBLIC_KEY = "./key_pairs/mediawiki.pub"
}

data "template_file" "user_data" {
  template = file("${path.module}/files/templates/user-data.sh")
}