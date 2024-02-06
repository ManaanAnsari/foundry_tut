// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import {console} from "forge-std/console.sol";

contract Counter {
    uint256 public number = 0;

    function inc() public {
        console.log("inc() called", number);
        number++;
    }

    function dec() public {
        number--;
    }
}
