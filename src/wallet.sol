// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

contract Wallet {
    address payable public owner;

    event Deposit(address account, uint256 amount);

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint256 _amount) external {
        require(msg.sender == owner, "You are not the owner");
        (bool ok, ) = payable(msg.sender).call{value: _amount}("");
        require(ok, "Failed to send Ether");
    }

    function setOwner(address _owner) external {
        require(msg.sender == owner, "You are not the owner");
        owner = payable(_owner);
    }
}
