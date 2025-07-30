require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

module.exports = {
  solidity: "0.8.28",
  networks: {
    liskSepolia: {
      url: process.env.LISK_SEPOLIA_RPC || "https://rpc.sepolia-api.lisk.com",
      chainId: 4202,
      accounts: [process.env.PRIVATE_KEY],
    },
  },
};
