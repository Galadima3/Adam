// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Bravo {
    mapping(address => string) public userData;
    mapping(address => mapping(string => uint256)) public studentData;

    function setUser(address user, string calldata name) external {
        userData[user] = name;
    }

    function setStudent(
        address student,
        string calldata name,
        uint256 matricNumber
    ) external {
        studentData[student][name] = matricNumber;
    }

    function expelStudent(address student, string calldata name) external {
        delete studentData[student][name];
    }
}
