// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.16;

import "../lib/forge-std/src/Test.sol";
import "../src/W3dSoftwareToken.sol";

contract W3dSoftwareTokenTest is Test {
    W3dSoftwareToken token;
    address ribeiro = vm.addr(0x1);
    address vagner = vm.addr(0x2);

    function setUp() public {
        token = new W3dSoftwareToken();
    }

    function testTokenName() public {
        assertEq(token.name(), "W3d Software Token");
    }

    function testTokenSymbol() public {
        assertEq(token.symbol(), "W3ST");
    }

    function testTranfer() public {
        assertTrue(token.transfer(ribeiro, 5000000));
        assertEq(token.balanceOf(ribeiro), 5000000);
        assertEq(token.balanceOf(address(this)), 5000000);
    }

    function testAprove() public {
        assertTrue(token.approve(ribeiro, 5000000));
    }

    function testAllowance() public {
        assertTrue(token.approve(ribeiro, 5000000));
        assertEq(token.allowance(address(this), ribeiro), 5000000);
    }

    function testTranferFrom() public {
        assertTrue(token.approve(ribeiro, 5000000));
        assertEq(token.allowance(address(this), ribeiro), 5000000);
        vm.prank(ribeiro);
        assertTrue(token.transferFrom(address(this), vagner, 5000000));
        assertEq(token.balanceOf(vagner), 5000000);
        vm.stopPrank();
    }
}
