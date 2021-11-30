// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./LiquidityProvider.sol";
import "./Dai.sol";

contract Operator is Dai {
    // LiquidityProvider public liquidityToken;
    Dai public dai;
    uint256 public FEE = 1_000; //10%

    constructor(address daiAddress) {
        // liquidityToken = LiquidityProvider(lpAddress);
        dai = Dai(daiAddress);
    }

    function deposit(uint256 amount) public {
        //get approved first
        dai.transferFrom(msg.sender, address(this), amount);
        _mint(msg.sender, amount);
    }

    function withdraw() public {}

    //1_000 basis points = 10 pct
    function calculateFee(uint256 amount) public view returns (uint256) {
        require((amount / 10000) * 10000 == amount, "too small");
        return (amount * FEE) / 10000;
    }
}
