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

    const approvedTx = await collateralBackedToken.approve(dai.address, value, {
      from: account,
    });
    console.log(approvedTx);

    await collateralBackedToken.deposit(value);

    console.log(`collateral backed token balance`);
    getBalance(collateralBackedToken, account);

    await collateralBackedToken.withdraw(value);

    console.log(`collateral backed token balance after withdraw`);
    getBalance(collateralBackedToken, account);

    // getBalance(operator, account);

    //
  } catch (error) {
    console.log(error);
  }
};
