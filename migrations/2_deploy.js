const LiquidityProvider = artifacts.require("LiquidityProvider");
const Operator = artifacts.require("Operator");

module.exports = async (deployer, network, accounts) => {
  await deployer.deploy(LiquidityProvider);
  const liquidityProvider = await LiquidityProvider.deployed();

  await deployer.deploy(Operator, liquidityProvider.address);
  const operator = await Operator.deployed();
};
