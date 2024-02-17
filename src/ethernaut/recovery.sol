// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Dev {
    function getAddr(address _sender) public pure returns (address) {
        // nonce0= address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xd6), bytes1(0x94), _sender, bytes1(0x80))))));
        address nonce1= address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xd6), bytes1(0x94), _sender, bytes1(0x01))))));
        return  nonce1;

    }
}


//  factory : 0x26A2C14dF760B884f3fC3c7106c1969CC2e57482

// there are 2 ways 
// either get it from ether scan like bellow 
//  deployed tojen contract : 0xC31dE14218b66922E74A2649a6dac9Faef406762 (got from etherscan)
// or use the above contract to get the address as its deterministic 
// https://ethereum.stackexchange.com/questions/760/how-is-the-address-of-an-ethereum-contract-computed


contract Recovery {

  //generate tokens
  function generateToken(string memory _name, uint256 _initialSupply) public {
    new SimpleToken(_name, msg.sender, _initialSupply);
  
  }
}

contract SimpleToken {

  string public name;
  mapping (address => uint) public balances;

  // constructor
  constructor(string memory _name, address _creator, uint256 _initialSupply) {
    name = _name;
    balances[_creator] = _initialSupply;
  }

  // collect ether in return for tokens
  receive() external payable {
    balances[msg.sender] = msg.value * 10;
  }

  // allow transfers of tokens
  function transfer(address _to, uint _amount) public { 
    require(balances[msg.sender] >= _amount);
    balances[msg.sender] = balances[msg.sender] - _amount;
    balances[_to] = _amount;
  }

  // clean up after ourselves
  function destroy(address payable _to) public {
    selfdestruct(_to);
  }
}