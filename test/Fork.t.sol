// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;
import {Test, console} from "forge-std/Test.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract ForkTest is Test {
    IERC20 dai;

    function setUp() public {
        dai = IERC20(address(0x3e622317f8C93f7328350cF0B56d9eD4C620C5d6));
    }

    function testDeposit() public {
        address user = address(123);
        uint256 balance = dai.balanceOf(user);
        console.log("balance: %d", balance);
        console.log("total supply: %s", dai.totalSupply());
        deal(address(dai), user, 1e6 * 1e18, true);
        console.log("balance: %d", dai.balanceOf(user));
        console.log("total supply: %s", dai.totalSupply());
    }
}
