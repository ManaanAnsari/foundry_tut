// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import {Test, console2, stdError, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
    }

    function testInc() public {
        assertEq(counter.number(), 0);
        counter.inc();
        assertEq(counter.number(), 1);
    }

    function testFailDec() public {
        counter.dec();
    }

    function testUnderFlow() public {
        vm.expectRevert(stdError.arithmeticError);
        console.log("expecting revert");
        counter.dec();
    }
}
