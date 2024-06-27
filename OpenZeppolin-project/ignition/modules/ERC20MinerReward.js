const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("ERC20MinerReward", (m) => {
  const ERC20MinerReward = m.contract("ERC20MinerReward");
  return { ERC20MinerReward };
});
