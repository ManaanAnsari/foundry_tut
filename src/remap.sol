// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;
// import "solmate/tokens/ERC20.sol";

// contract Rmap is ERC20 {
//     constructor() ERC20("Rmap", "RMAP", 18) {
//         _mint(msg.sender, 1000000000000000000000000000);
//     }
// }

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Rmap is ERC20 {
    constructor() ERC20("Rmap", "RMAP") {
        _mint(msg.sender, 1000000000000000000000000000);
    }
}
