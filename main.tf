provider "aws" {
  region = "ap-southeast-2"
(*   access_key = "AKIA5FTZA73XHLM5Y3KG"
  secret_key = "WHAkR9U+V5uUvU87mLc9mZvyW31AGFA5T9ztvp/Skey" *)
}

module "launch_ec2" {
  source = "./launch_ec2"

}
