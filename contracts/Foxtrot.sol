// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Eventful {
    event Log(address indexed sender, string message);
    event AnotherLog();

    function sicario() public {
        emit Log(msg.sender, "Hello, World!");
    }
}
