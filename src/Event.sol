// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.17;

contract Event {
    event Transfer(address indexed from, address indexed to, uint256 value);

    function transfer(address _from, address _to, uint256 _value) public {
        emit Transfer(_from, _to, _value);
    }

    function trasferMany(
        address _from,
        address[] memory _tos,
        uint256[] memory _values
    ) public {
        for (uint256 i = 0; i < _tos.length; i++) {
            emit Transfer(_from, _tos[i], _values[i]);
        }
    }
}
