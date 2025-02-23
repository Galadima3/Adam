// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Hotel {
    address payable public owner;
    mapping (address => uint256) public balances;

    constructor () payable  {
        owner = payable(msg.sender);
    }

    function deposit() public payable minimumAmount {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {}

     // Function to transfer Ether from this contract to address from input
    function transfer(address payable _to, uint256 _amount) public {
        uint256 remainingBalance = balances[msg.sender];
        require(remainingBalance < 1 ether , "Insufficient Funds!!");
        // Note that "to" is declared as payable
        (bool success,) = _to.call{value: _amount}("");
        require(success, "Failed to send Ether");
    }

    modifier minimumAmount(){
        require(msg.value >= 1 ether, "Deposit too small!!");
        _;
    }
}