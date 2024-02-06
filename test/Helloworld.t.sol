// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import {Test, console2} from "forge-std/Test.sol";
import {HelloWorld} from "../src/HelloWorld.sol";

contract HelloWorldTest is Test {
    HelloWorld public helloWorld;

    function setUpdd() public {
        helloWorld = new HelloWorld();
    }

    function test_SetGreeting() public {
        assertEq(helloWorld.greeting(), "Hello World!");
    }
}
