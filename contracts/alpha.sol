// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Alpha {
    string constant public NAME = "Mylez";
    uint256 public favouriteNumber = 9;
    address public immutable myAddress;

    constructor () {
        myAddress = msg.sender;
    }


    //Redundant Function
    function get() public view returns (uint256) {
        return favouriteNumber;
    }

    function increment() public {
        favouriteNumber += 1;
    }

    function decrement() public nullCheck {
        favouriteNumber -= 1;
    }

    modifier nullCheck {
        require(favouriteNumber != 0, "Number is 0");
        _;
    }

}