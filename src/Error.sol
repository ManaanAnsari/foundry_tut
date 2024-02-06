// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.17;

contract Error {
    error NotAuthorized();

    function throwError() public {
        require(false, "Error Message");
    }

    function throwCustomError() public {
        revert NotAuthorized();
    }
}
