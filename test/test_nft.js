const { expect } = require("chai");

describe("Token", function () {
  it("Deployment should assign the total supply of tokens to the owner", async function () {
    const [owner] = await ethers.getSigners();

    const PT = await ethers.getContractFactory("PARTYBOARDNFT");

    const hardhatToken = await PT.deploy();

    const result = await hardhatToken.mint(owner.address, 1000000)

    const uri = await hardhatToken.setBaseURI("localhost:8080/")

    const tokenrui = await hardhatToken.tokenURI(1000000);

    console.log(tokenrui);
  });
});