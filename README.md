# Simple On-Chain Voting

This repository contains a high-quality, flat-structured implementation of a decentralized voting system. It is designed for DAOs (Decentralized Autonomous Organizations) or small communities to reach consensus transparently on the blockchain.

## Features
* **Proposal Management:** Only the administrator can create new proposals to be voted on.
* **Transparent Voting:** Every vote is recorded on-chain, ensuring tamper-proof results.
* **One-Vote-Per-User:** Built-in logic to prevent double-voting by the same address.
* **Real-time Results:** Tallying happens automatically as votes are cast.

## Getting Started
1. Open [Remix IDE](https://remix.ethereum.org/).
2. Create a file named `Voting.sol`.
3. Deploy the contract and use `addProposal` to start a session.
4. Users can then call `vote` with the specific Proposal ID.

## License
MIT
