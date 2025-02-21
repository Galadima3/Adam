// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Delta {
    uint256 public userBalance = 1 ether;

    //Require
    function req(uint256 input) public pure returns (string memory verdict) {
        require(input >= 18, "User is a minor");
        return "You can't vote!";
    }

    //Revert & Assert
    function rev(uint256 revInput) public pure {
        assert(revInput != 0);
        if (revInput <= 5) {
            revert("Input must be greater than 5");
        }
    }

    //Custom Error
    error InsufficientBalance(uint256 balance, uint256 withdrawAmount);
    function customError(uint256 _withdrawal) public view {
        uint256 bal = address(this).balance;
        if (bal < _withdrawal) {
            revert InsufficientBalance({
                balance: bal,
                withdrawAmount: _withdrawal
            });
        }
    }
}
