// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
import "contracts/interfaces/IBank.sol";

contract User {
    IBank public bank;

    constructor(address _extAddress) {
        bank = IBank(_extAddress);
    }

    function depositToBank() external payable {
        require(msg.value > 0, "Must send some ETH");
        bank.deposit{value: msg.value}();
    }

    function withdrawFromBank(uint256 amount) external {
        bank.withdraw(amount); 
    }

    function checkBankBalance() external view returns (uint256) {
        return bank.getBalance(msg.sender); 
    }
}
