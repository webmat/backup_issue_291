# Reproducing backup issue 291

This assumes you have RVM installed. Otherwise install ruby 1.9.3p125.

```shell
cd backup_issue_291
export AWS_KEY=[your key]
export AWS_SECRET=[your secret]
bundle install
bundle exec backup perform --trigger=dummy --config-file=./Backup/config.rb
```

Results in

```
[2012/03/16 09:19:21][message] Performing Backup for 'Sync this dummy setup (dummy)'!
[2012/03/16 09:19:21][message] [ backup 3.0.23 : ruby 1.9.3p125 (2012-02-16 revision 34643) [x86_64-darwin11.3.0] ]
[2012/03/16 09:19:21][message] Backup::Syncer::S3 started the syncing process:
[2012/03/16 09:19:21][error] ModelError: Backup for Sync this dummy setup (dummy) Failed!
[2012/03/16 09:19:21][error]   An Error occured which has caused this Backup to abort before completion.
[2012/03/16 09:19:21][error]   Reason: ArgumentError
[2012/03/16 09:19:21][error]   Missing required arguments: aws_access_key_id, aws_secret_access_key
[2012/03/16 09:19:21][error] 
[2012/03/16 09:19:21][error] Backtrace:
# ...
```

Now uncomment lines 5 and 6 in Backup/models/dummy.rb

```shell
bundle exec backup perform --trigger=dummy --config-file=./Backup/config.rb
```

```
[2012/03/16 09:24:02][message] Performing Backup for 'Sync this dummy setup (dummy)'!
[2012/03/16 09:24:02][message] [ backup 3.0.23 : ruby 1.9.3p125 (2012-02-16 revision 34643) [x86_64-darwin11.3.0] ]
[2012/03/16 09:24:02][message] Backup::Syncer::S3 started the syncing process:
[2012/03/16 09:24:03][message]   Generating checksums for /Users/mat/backup_issue_291
# ...
```
