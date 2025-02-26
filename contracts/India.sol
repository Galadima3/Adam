// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract SinzuMoney {
    // Receiving Funds
    receive() external payable { }
    fallback () external payable {}

    function getBalance () public view returns(uint256){
        return address(this).balance;
    }

    //Sending ether
    function send(address payable receiver, uint256 amount) public  payable {
        (bool sent, ) = receiver.call{value: amount}("");
        require(sent, "Failed Txn");

    }
}