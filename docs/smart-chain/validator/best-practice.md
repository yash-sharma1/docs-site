# Best Practice

## Store your BNB with a hardware wallet

The most valuable assets of a validator are two keys: one for signing transactions and another for signing blocks


## Securing your fullnode RPC from hackers

Please do not expose your RPC endpoints to public network.


## Account Private keys

To protect your BNB, do not share your 24 words with anyone. The only person who should ever need to know them is you. In short, HSMs are affordable, performant and portable pieces of hardware that help to securely generate, store and manage your private keys. Malware attacks and remote extraction of private keys are much more difficult when an HSM is configured properly.

## Software Vulnerabilities

To protect your BNB, you should only download software directly from official sources, and make sure that you're always using the latest, most secure version


## Running Server as a Daemon
It is important to keep `geth` running at all times. There are several ways to achieve this, and the simplest solution we recommend is to register `geth`  as a systemd service so that it will automatically get started upon system reboots and other events.


