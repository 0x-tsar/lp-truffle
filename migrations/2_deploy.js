const CollateralBackedToken = artifacts.require("CollateralBackedToken");
const Dai = artifacts.require("Dai");

module.exports = async (deployer, network, accounts) => {
  await deployer.deploy(Dai);
  const dai = await Dai.deployed();

  await deployer.deploy(CollateralBackedToken, dai.address);
  const collateralBackedToken = await CollateralBackedToken.deployed();
  console.log(`contracts deployed`);
};
