// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract November {
    function sum (uint256 a, uint256 b) public pure returns (uint256){
        /*
        	927 gas
            return a + b;
        */

        unchecked {
            // Costs 748 gas
            return a + b;
        }
    } 
}

