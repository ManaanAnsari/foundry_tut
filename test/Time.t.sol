// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.17;

import {Test} from "forge-std/Test.sol";
import {Auction} from "../src/Auction.sol";

contract TimeTest is Test {
    Auction auction;
    uint256 public startAt;

    function setUp() public {
        auction = new Auction();
        startAt = block.timestamp;
    }

    function testBidRevert() public {
        vm.expectRevert("Auction not started");
        auction.bid();
    }

    function testBid() public {
        vm.warp(startAt + 1 days);
        auction.bid();
    }

    function testBidEndfail() public {
        vm.expectRevert("Auction ended");
        vm.warp(startAt + 5 days);
        auction.bid();
    }

    function testEndRevert() public {
        vm.expectRevert("Auction not ended");
        auction.end();
    }

    function testTimestamp() public {
        uint t = block.timestamp;
        skip(100);
        assertEq(block.timestamp, t + 100);
        rewind(10);
        assertEq(block.timestamp, t + 100 - 10);
    }
}
