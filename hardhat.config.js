require("@nomiclabs/hardhat-ethers");
require("dotenv").config();

module.exports = {
  networks: {
    sepolia: {
      url: process.env.ALCHEMY_URL,
      accounts: [process.env.PRIVATE_KEY]
    }
  },
  solidity: "0.8.20"
};