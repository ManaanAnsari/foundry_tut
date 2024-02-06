// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;
import {Test} from "forge-std/Test.sol";
import {Wallet} from "../src/wallet.sol";

contract TestSendEth is Test {
    Wallet wallet;

    function setUp() public {
        wallet = new Wallet();
    }

    function testSendEth() public {
        uint256 balance = address(wallet).balance;

        deal(address(1), 100);
        assertEq(address(1).balance, 100);
        vm.prank(address(1));
        (bool ok, ) = address(wallet).call{value: 1}("");
        assertEq(ok, true, "Wallet: transfer failed");
        assertEq(address(wallet).balance, balance + 1);

        hoax(address(2), 100);
        assertEq(address(2).balance, 100);
        (ok, ) = address(wallet).call{value: 1}("");
        assertEq(ok, true, "Wallet: transfer failed");
        assertEq(address(wallet).balance, balance + 2);
    }
}
