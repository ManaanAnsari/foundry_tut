// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.17;
import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/Console.sol";

contract SignTest is Test {
    function testSign() public {
        uint privkey = 123;
        address pubkey = vm.addr(privkey);
        bytes32 message_hash = keccak256(abi.encodePacked("hello world"));
        // sign the message
        (uint8 v, bytes32 r, bytes32 s) = vm.sign(privkey, message_hash);
        console.log("v: %d", v);
        console.logBytes32(r);
        console.logBytes32(s);
        // get the signer address
        address signer = ecrecover(message_hash, v, r, s);
        // should be the same as the public key
        assertEq(signer, pubkey);
    }
}
