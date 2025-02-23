// SPDX-License-Identifier: MIT
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
pragma solidity 0.8.26;

contract Bank is ReentrancyGuard {
    mapping(address => uint256) public balances;

    // Deposit
    function deposit() external payable {
        require(msg.value >= 0.1 ether, "Invalid Funds!!");
        balances[msg.sender] += msg.value;
    }

    // Withdraw
    function withdraw(uint256 amount) external nonReentrant {
        require(balances[msg.sender] >= amount, "Insufficient balance");

        // Update the balance
        balances[msg.sender] -= amount;

        // Perform the external call
        (bool success, ) = payable(msg.sender).call{value: amount}("");
        require(success, "Transfer failed");
    }
}
