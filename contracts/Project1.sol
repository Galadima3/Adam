// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Account {
    uint256 public balance;

    function deposit(uint256 _amount) public {
        balance += _amount;
    }

    function withdraw(uint256 _amount) public {
        require(balance >= _amount, "Underflow");
        balance -= _amount;
    }
}
