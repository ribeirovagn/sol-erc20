// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.16;

import "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract W3dSoftwareToken is ERC20 {
    constructor() ERC20("W3d Software Token", "W3ST") {
        _mint(msg.sender, 10000000);
    }
}
