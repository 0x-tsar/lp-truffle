// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./LiquidityProvider.sol";

contract Operator {
    LiquidityProvider public liquidityToken;
    uint256 public FEE = 1_000; //10%

    constructor(address lpAddress) {
        liquidityToken = LiquidityProvider(lpAddress);
    }

    function deposit(uint256 amount) public {
        //aprove this contract first first
        liquidityToken.transferFrom(msg.sender, address(this), amount);
        liquidityToken.mint(msg.sender, amount);
    }

    function withdraw(uint256 amount) public {
        liquidityToken.burn(msg.sender, amount);
        liquidityToken.transfer(msg.sender, amount);
    }

    //185 basis points = 1.85 pct
    function calculateFee(uint256 amount) external view returns (uint256) {
        require((amount / 10000) * 10000 == amount, "too small");

        return (amount * FEE) / 10000;
    }
}
