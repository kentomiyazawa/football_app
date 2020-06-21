require "refile/s3"

aws = {
  access_key_id: "AWS_ACCESS_KEY_ID2",
  secret_access_key: "AWS_SECRET_ACCESS_KEY2",
  region: "ap-northeast-1",
  bucket: "footballforeveryone",
}
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)