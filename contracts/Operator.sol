// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./LiquidityProvider.sol";

contract Operator is ERC20 {
    LiquidityProvider public liquidityToken;
    uint256 public FEE = 1_000; //10%

    constructor(address lpAddress) ERC20("Operator Token", "OPT") {
        liquidityToken = LiquidityProvider(lpAddress);
        _mint(msg.sender, 3 * 10**18);
    }

    function deposit(uint256 amount) public {
        //aprove this contract first first
        transferFrom(msg.sender, address(this), amount);
        uint256 lp = calculateFee(amount);
        _mint(msg.sender, amount + lp);
    }

    function withdraw() public {
        require(balanceOf(msg.sender) > 0, "you dont have anough");
        liquidityToken.burn(msg.sender, balanceOf(msg.sender));
    }

    //185 basis points = 1.85 pct
    function calculateFee(uint256 amount) public view returns (uint256) {
        require((amount / 10000) * 10000 == amount, "too small");
        return (amount * FEE) / 10000;
    }
}
