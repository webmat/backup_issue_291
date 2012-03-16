Backup::Model.new(:dummy, 'Sync this dummy setup') do
  sync_with S3 do |s3|
    # Uncomment this to make it work.
    # See https://github.com/meskyanichi/backup/issues/291
    s3.access_key_id     = ENV['AWS_KEY']
    s3.secret_access_key = ENV['AWS_SECRET']
    s3.bucket            = "backup-issue-291-#{Time.now.to_i}"

    s3.concurrency_type  = :threads
    s3.concurrency_level = 5
    s3.path              = "/"
    s3.mirror            = true

    s3.directories do |directory|
      directory.add Dir.pwd
    end
  end
end
