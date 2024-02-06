// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract IBXToken is ERC20 {
    constructor() ERC20("IBX Token", "IBX") {
        _mint(msg.sender, 1000000 * 1e18);
    }
}
