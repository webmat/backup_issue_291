# encoding: utf-8

Backup::Configuration::Storage::S3.defaults do |s3|
  s3.access_key_id     = ENV['AWS_KEY']
  s3.secret_access_key = ENV['AWS_SECRET']
  s3.region            = "us-east-1"
end

Dir[File.join(File.dirname(Config.config_file), "models", "*.rb")].each do |model|
  instance_eval(File.read(model))
end
