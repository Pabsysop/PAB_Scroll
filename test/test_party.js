const { expect } = require("chai");

describe("Token contract", function () {
  it("Deployment should assign the total supply of tokens to the owner", async function () {
    const [owner] = await ethers.getSigners();

    const PT = await ethers.getContractFactory("PartyToken");

    const hardhatToken = await PT.deploy();

    const result = await hardhatToken.mint(owner.address, 1000000)

    const ownerBalance = await hardhatToken.balanceOf(owner.address);

    expect(await hardhatToken.totalSupply()).to.equal(ownerBalance);
    console.log(ownerBalance);
  });
});