/** @type import('hardhat/config').HardhatUserConfig */
require("@nomicfoundation/hardhat-toolbox");
require('dotenv').config();

module.exports = {
  defaultNetwork: "hardhat",
  networks: {
    hardhat: {
    },
    matic: {
      url: "https://rpc-mumbai.maticvigil.com",
      accounts: [process.env.PRIVATE_KEY]
    },
    scroll: {
      url: "https://prealpha.scroll.io/l2",
      accounts: [process.env.SCROLL_PRIVATE]
    }

  },
  solidity: {
    version: "0.8.1",
  },
  paths: {
    sources: "./contracts",
    tests: "./test",
    cache: "./cache",
    artifacts: "./artifacts"
  },
  mocha: {
    timeout: 20000
  }
};
