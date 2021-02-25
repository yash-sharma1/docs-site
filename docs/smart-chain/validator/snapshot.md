# Snapshot

Latest snapshot: [download](https://s3.ap-northeast-1.amazonaws.com/dex-bin.bnbstatic.com/s3-witness-data-download/chaindata_202102.zip?AWSAccessKeyId=AKIAYINE6SBQPUZDDRRO&Expires=1640142393&Signature=aIiUN%2BJLmFKXkAAc%2BE6xHCW3b14%3D) (87.4 GB, md5sum )


The following commands are step by step instructions for BSC node operators that can be used for two major use-cases:
1. Fixing nodes that are stuck or crashed;
2. Jumpstarting a newly setup validator node; avoid waiting some hours for synchronization

Basically, a compressed version of the last-known "good" chaindata is downloaded. Remove the node's old data and update it with the newly downloaded data. Finally, restart the sync-process from this known-good checkpoint.


Note: Ensure there is enough disk space for both the tar file AND its uncompressed contents. Double the space or more.