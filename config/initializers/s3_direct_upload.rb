S3DirectUpload.config do |c|
  c.access_key_id = ApplicationConfig["AWS_S3_VIDEO_ID"]
  c.secret_access_key = ApplicationConfig["AWS_S3_VIDEO_KEY"]
  c.bucket = ApplicationConfig["AWS_S3_INPUT_BUCKET"]
  c.region = nil
  c.url = nil
end
