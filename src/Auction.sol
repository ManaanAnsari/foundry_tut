// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

contract Auction {
    uint256 public startAt = block.timestamp + 1 days;
    uint256 public endAt = block.timestamp + 2 days;

    function bid() public {
        require(block.timestamp >= startAt, "Auction not started");
        require(block.timestamp <= endAt, "Auction ended");
    }

    function end() public {
        require(block.timestamp >= endAt, "Auction not ended");
    }
}
