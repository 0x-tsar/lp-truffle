// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Operator {
    IERC20 public liquidityToken;

    constructor(address lpAddress) {
        liquidityToken = IERC20(lpAddress);
    }

    function name(type name) {
      
    }
}
