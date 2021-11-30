const LiquidityProvider = artifacts.require("LiquidityProvider");
const Operator = artifacts.require("Operator");

const getBalance = async (op, acc) => {
  let balance = await op.balanceOf(acc);
  console.log(balance.toString());
};

module.exports = async () => {
  try {
    const liquidityProvider = await LiquidityProvider.deployed();
    const operator = await Operator.deployed();

    const [account, _] = await web3.eth.getAccounts();

    // console.log(operator.methods);
    // console.log(account);

    const value = web3.utils.toWei("0.01");

    // const approvedTx = await operator.approve(operator.address, value, {
    //   from: account,
    // });
    // console.log(approvedTx);

    // const tx = await operator.deposit(value);
    // console.log(tx);

    getBalance(operator, account);

    const tx = await operator.withdraw();
    console.log(tx);

    getBalance(operator, account);

    //
  } catch (error) {
    console.log(error);
  }
};
