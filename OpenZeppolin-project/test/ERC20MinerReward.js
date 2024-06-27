const { expect } = require("chai");
const hre = require("hardhat");
describe("ERC20MinerReward", function () {
  let ERC20MinerReward;
  before(async () => {
    // ⽣成合约实例并且复⽤
    ERC20MinerReward = await hre.ethers.deployContract("ERC20MinerReward");
  });

  it("getBalance", async () => {
    await ERC20MinerReward.getBalance();
  });

  it("transferFrom", async () => {
    await ERC20MinerReward.transferFrom(
      "0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266",
      "0x70997970c51812dc3a010c7d01b50e0d17dc79c8",
      123456789
    );
  });
});
