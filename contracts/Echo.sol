// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Echo {
    address public owner;
    bool internal locked;

    constructor() {
        owner = msg.sender;
    }

    //Confirms ownership
    modifier onlyOwner() {
        require(owner == msg.sender, "No be you get am!");
        _;
    }

    //Validates addresses
    modifier validAddress(address _addr) {
        require(_addr != address(0), "Invalid address");
        _;
    }

    //Reentrancy Protection
    modifier reentrancyGuard() {
        require(!locked, "No reentrancy!");
        locked = true;
        _;
        locked = false;
    }
}
