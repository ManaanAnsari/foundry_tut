// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;
import {Test} from "forge-std/Test.sol";
import {Event} from "../src/Event.sol";

contract EventTest is Test {
    Event public e;
    event Transfer(address indexed from, address indexed to, uint256 value);

    function setUp() public {
        e = new Event();
    }

    function testEmitTransfer() public {
        // function expectEmit(
        //     bool checkTopic1,
        //     bool checkTopic2,
        //     bool checkTopic3,
        //     bool checkData
        // ) external;

        // 1. Tell Foundry which data to check
        // Check index 1, index 2 and data
        vm.expectEmit(true, true, false, true);
        // emit the identical event here
        emit Transfer(address(1), address(2), 100);
        // call the function that emits the actual event
        e.transfer(address(1), address(2), 100);
    }
}
