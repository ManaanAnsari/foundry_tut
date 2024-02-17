// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.0.0) (token/ERC20/IERC20.sol)

pragma solidity ^0.8.20;

/**
 * @dev Interface of the ERC-20 standard as defined in the ERC.
 */
interface IERC20 {

    function balanceOf(address account) external view returns (uint256);

    function approve(address spender, uint256 value) external returns (bool);

    function transferFrom(address from, address to, uint256 value) external returns (bool);
}

contract Hack{

    // deploy hack
    // approve hack to spend from naught
    // call pwn and spend it using transferfrom 
    function pwn(IERC20 _target, address _player) public {
        _target.transferFrom(_player,address(this),_target.balanceOf(_player));
    }
}

