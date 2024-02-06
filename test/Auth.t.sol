// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.17;

import {Test} from "forge-std/Test.sol";
import {Wallet} from "../src/wallet.sol";

contract Auth is Test {
    Wallet wallet;

    function setUp() public {
        wallet = new Wallet();
    }

    function testSetOwner() public {
        wallet.setOwner(address(1));
        assertEq(wallet.owner(), address(1));
    }

    function testFailSetOwner() public {
        vm.prank(address(1));
        // next line will be executed with user as ablove
        // and will fail
        wallet.setOwner(address(1));
    }

    function testFailSetOwneragain() public {
        wallet.setOwner(address(1));
        vm.startPrank(address(1));
        // next line will be executed with user as ablove
        wallet.setOwner(address(2));
        wallet.setOwner(address(3));
        vm.stopPrank();

        // wallet.setOwner(address(1));
    }
}
