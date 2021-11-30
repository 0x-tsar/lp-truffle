const LiquidityProvider = artifacts.require("LiquidityProvider");
const Operator = artifacts.require("Operator");

module.exports = async () => {
  try {
    const liquidityProvider = await LiquidityProvider.deployed();
    const operator = await Operator.deployed();

    const [account, _] = await web3.eth.getAccounts();

    console.log(operator.methods);
    console.log(account);

    //
  } catch (error) {
    console.log(error);
  }
};
