const LiquidityProvider = artifacts.require("LiquidityProvider");
const Operator = artifacts.require("Operator");
const Dai = artifacts.require("Dai");

module.exports = async (deployer, network, accounts) => {
  // await deployer.deploy(LiquidityProvider);
  // const liquidityProvider = await LiquidityProvider.deployed();

  await deployer.deploy(Dai);
  const dai = await Dai.deployed();

  await deployer.deploy(Operator, dai.address);
  const operator = await Operator.deployed();
};
