// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;
import {Script, console} from "forge-std/Script.sol";
import {IBXToken} from "../src/IBXToken.sol";

contract DeployToken is Script {
    function setUp() public {}

    function run() public {
        // get admin
        uint priv = vm.envUint("PRIV");
        address admin = vm.addr(priv);
        console.log("admin: %s", admin);

        vm.startBroadcast();
        // deply token
        IBXToken token = new IBXToken();
        vm.stopBroadcast();
        console.log("token: %s", address(token));
    }
}
