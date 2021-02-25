# Security

Each validator candidate is encouraged to run its operations independently, as diverse setups increase the resilience of the network.

## Sentry Nodes (DDOS Protection)

Validators are responsible for ensuring that the network can sustain denial of service attacks.One recommended way to mitigate these risks is for validators to carefully structure their network topology in a so-called sentry node architecture.
Sentry nodes can be quickly spun up or change their IP addresses. Because the links to the sentry nodes are in private IP space, an internet based attacked cannot disturb them directly. This will ensure validator block proposals and votes always make it to the rest of the network.

To setup your sentry node architecture you can follow the instructions below:

1. Build a private network and setup trusted private connections between validator node and it sentry

2. Set sentry as Trusted node for validator node

3. Set validator as static node for sentry

<img src="https://lh3.googleusercontent.com/w6notWcdyEXayM592WuI5xcpysFqgkwwBSX3sBZFIc34SHrKewZYlNMBMyGBPs375ez78i4gZmbnMyMn3Ry5s6Z6qTejatPYdDXL67moRhGmAQsjNNVF0CRZz10yznx13U34fKSc" alt="img" style="zoom:33%;" />