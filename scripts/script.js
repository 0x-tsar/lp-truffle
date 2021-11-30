const LiquidityProvider = artifacts.require("LiquidityProvider");
const Operator = artifacts.require("Operator");

module.exports = async () => {
  try {
    const liquidityProvider = await LiquidityProvider.deployed();
    const operator = await Operator.deployed();

    //
  } catch (error) {
    console.log(error);
  }
};
