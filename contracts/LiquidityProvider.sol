// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract LiquidityProvider is ERC20 {
    constructor() ERC20("Liquidity Token", "LP") {}

    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }

    function burn(address to, uint256 amount) public {
        require(balanceOf(msg.sender) >= amount, "not enough");
        _burn(to, amount);
    }
}
