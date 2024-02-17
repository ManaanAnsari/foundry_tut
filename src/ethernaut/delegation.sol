// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Delegate {

  address public owner;

  constructor(address _owner) {
    owner = _owner;
  }

  function pwn() public {
    owner = msg.sender;
  }
}

contract Delegation {

  address public owner;
  Delegate delegate;

  constructor(address _delegateAddress) {
    delegate = Delegate(_delegateAddress);
    owner = msg.sender;
  }

  fallback() external {
    (bool result,) = address(delegate).delegatecall(msg.data);
    if (result) {
      this;
    }
  }
}

// the hack is simple just understand how the delegatecall and fall back works 
// 1st way :call pnw function on delegation contract as the function dsnt exist it will trigger fallback with pwn in msg data and delegate it according to the logic
// 2nd way : call the func from foundry .call("") btw its basically same 

// in remix you just use at func on Delegate contract with address of delegation contract 
// and call pnw hence it triggers a fallback on delegation becaus ethe method dosnt exists on the actual contract 





