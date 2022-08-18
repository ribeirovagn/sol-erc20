// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract W3dSoftwareToken is ERC20 {
    constructor(uint256 supply) ERC20("W3dSoftwareToken", "W3ST") {
        _mint(msg.sender, supply);
    }
}
