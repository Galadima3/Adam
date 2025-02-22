// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract A {
    string public name = "Contract Afghanistan";

    function getName () public view returns (string memory){
        return name;
    }
}

contract B is A {
    constructor (){
        name = "Contract Bolivia";
    }
}