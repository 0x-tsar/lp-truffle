// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./LiquidityProvider.sol";

contract Operator {
    IERC20 public liquidityToken;

    constructor(address lpAddress) {
        liquidityToken = IERC20(lpAddress);
    }

    function deposit(uint256 amount) public {
        //aprove this contract first first
        liquidityToken.transferFrom(msg.sender, address(this), amount);
        liquidityToken.mint(amount);
    }

    //185 basis points = 1.85 pct
    function calculateFee(uint256 amount) external pure returns (uint256) {
        require((amount / 10000) * 10000 == amount, "too small");

        return (amount * 185) / 10000;
    }
}
