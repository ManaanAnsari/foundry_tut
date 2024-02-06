// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.17;
import {Test} from "forge-std/Test.sol";
import {Error} from "../src/Error.sol";

contract ErrorTest is Test {
    Error err;

    function setUp() public {
        err = new Error();
    }

    function testFail() public {
        err.throwError();
    }

    function testRevert() public {
        vm.expectRevert();
        err.throwError();
    }

    function testRequireMessage() public {
        vm.expectRevert(bytes("Error Message"));
        err.throwError();
    }

    function testCustomError() public {
        vm.expectRevert(Error.NotAuthorized.selector);
        err.throwCustomError();
    }

    function testerrorLabel() public {
        assertEq(uint256(1), uint256(1), "test1");
        assertEq(uint256(1), uint256(1), "test2");
        assertEq(uint256(1), uint256(2), "test3");
        assertEq(uint256(1), uint256(1), "test4");
    }
}
