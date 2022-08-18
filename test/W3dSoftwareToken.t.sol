// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/W3dSoftwareToken.sol";

contract W3dSoftwareTokenTest is Test {
    W3dSoftwareToken token;
    address ribeiro = vm.addr(0x1);
    address vagner = vm.addr(0x2);

    function setUp() public {
        token = new W3dSoftwareToken(1000);
    }

    function testTokenName() public {
        assertEq(token.name(), "W3dSoftwareToken");
    }

    function testTokenSymbol() public {
        assertEq(token.symbol(), "W3ST");
    }

    function testTranfer() public {
        assertTrue(token.transfer(ribeiro, 500));
        assertEq(token.balanceOf(ribeiro), 500);
        assertEq(token.balanceOf(address(this)), 500);
    }

    function testAprove() public {
        assertTrue(token.approve(ribeiro, 500));
    }

    function testAllowance() public {
        assertTrue(token.approve(ribeiro, 500));
        assertEq(token.allowance(address(this), ribeiro), 500);
    }

    function testTranferFrom() public {
        assertTrue(token.approve(ribeiro, 500));
        assertEq(token.allowance(address(this), ribeiro), 500);
        vm.prank(ribeiro);
        assertTrue(token.transferFrom(address(this), vagner, 500));
        assertEq(token.balanceOf(vagner), 500);
        vm.stopPrank();
    }
}
