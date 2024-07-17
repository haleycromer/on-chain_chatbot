# On-Chain Chat Bot

A simple on-chain chat bot smart contract for Ethereum blockchain.

## Smart Contract

### ChatBot.sol

The `ChatBot` contract allows users to send and receive messages on-chain.

### Usage

To interact with the `ChatBot` contract, deploy it on an Ethereum network using Remix or another development environment. Users can send messages using the `sendMessage` function and retrieve messages using the `getMessageCount` and `getMessage` functions.

Example usage:
```solidity
// Deploy ChatBot contract
// Send a message
chatBot.sendMessage("Hello, World!");
// Retrieve message count
uint count = chatBot.getMessageCount(msg.sender);
// Retrieve message at index 0
string memory message = chatBot.getMessage(msg.sender, 0);
