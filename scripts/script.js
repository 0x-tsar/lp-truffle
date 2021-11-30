const LiquidityProvider = artifacts.require("LiquidityProvider");
const Operator = artifacts.require("Operator");

module.exports = async () => {
  try {
    const liquidityProvider = await LiquidityProvider.deployed();
    const operator = await Operator.deployed();

    const [account, _] = await web3.eth.getAccounts();

    console.log(operator.methods);
    console.log(account);

    const value = web3.utils.toWei("0.01");

    let balance = await operator.methods.balanceOf(account);
    console.log(balance.toString());

    //
  } catch (error) {
    console.log(error);
  }
};
