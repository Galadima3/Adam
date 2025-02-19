// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import "./EnumDeclaration.sol";

contract Charlie {
    MaritalStatus public maritalStatus;

    function setStatus(MaritalStatus _mstatus) public {
        maritalStatus = _mstatus;
    }

    function getStatus() public view returns (MaritalStatus) {
        return maritalStatus;
    }
}
