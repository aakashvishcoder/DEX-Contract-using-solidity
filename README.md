# DEX Contract

## General Process

<p>Decentralized Exchanges (DEXs) have always been fascinating to me because they allow people to trade cryptocurrencies without relying on a centralized authority. After seeing how impactful Uniswap and similar platforms were, I wanted to challenge myself to create my own DEX using Solidity.</p> <p>To create this project, I had to learn and implement core blockchain development concepts such as ERC-20 token standards, liquidity pools, and automated market maker (AMM) algorithms. I used Solidity to write the smart contract logic, deployed it on a testnet using Hardhat, and interacted with it via a simple frontend using Web3.js. The DEX allows users to swap between two tokens, add/remove liquidity, and view pool reserves — all without any central control. In the future, I plan to enhance it by adding multiple trading pairs and integrating with popular wallets like MetaMask directly from the UI.</p>

## Complications

<p>One of the biggest challenges was implementing the AMM pricing formula correctly (`x * y = k`) and ensuring the math didn’t break due to Solidity’s lack of floating-point numbers. I also had to manage reentrancy protection, transaction gas optimization, and safely handle token transfers between users and the contract.</p>

## Tech Stack

- Solidity
- Hardhat

```bash
git clone repo
cd your-repo
