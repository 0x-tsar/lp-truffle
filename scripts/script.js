const Dai = artifacts.require("Dai");
const CollateralBackedToken = artifacts.require("CollateralBackedToken");

const getBalance = async (con, acc) => {
  let balance = await con.balanceOf(acc);
  console.log(balance.toString());
};

module.exports = async () => {
  try {
    const [account, _] = await web3.eth.getAccounts();
    const dai = await Dai.deployed();
    const collateralBackedToken = await CollateralBackedToken.deployed();

    const value = web3.utils.toWei("0.01");

    // const approvedTx = await operator.approve(operator.address, value, {
    //   from: account,
    // });
    // console.log(approvedTx);

    // const tx = await operator.deposit(value);
    // console.log(tx);

    // getBalance(operator, account);

    // const tx = await operator.withdraw();
    // console.log(tx);

    // getBalance(operator, account);

    //
  } catch (error) {
    console.log(error);
  }
};
