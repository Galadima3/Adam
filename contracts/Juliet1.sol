// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Reciever {
    event Received(address caller, uint256 amount, string message);

    fallback() external payable {
        emit Received(msg.sender, msg.value, "Fallback was called");
    }

    //receive() external payable { }

    function foo(string memory _message, uint256 _x)
        public
        payable
        returns (uint256)
    {
        return _x + 1;
    }
}
