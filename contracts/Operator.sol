// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./LiquidityProvider.sol";

contract Operator is ERC20 {
    LiquidityProvider public liquidityToken;
    uint256 public FEE = 1_000; //10%

    constructor(address lpAddress) ERC20("Operator Token", "OPT") {
        liquidityToken = LiquidityProvider(lpAddress);
    }

    function deposit(uint256 amount) public {}

    function withdraw() public {}

    //1_000 basis points = 10 pct
    function calculateFee(uint256 amount) public view returns (uint256) {
        require((amount / 10000) * 10000 == amount, "too small");
        return (amount * FEE) / 10000;
    }
}
