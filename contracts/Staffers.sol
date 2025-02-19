// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// import "./StructDeclaration.sol";

contract Staffers {
    struct Staffer {
        bytes32 name;
        uint256 staffID;
        bytes32 jobTitle;
    }
    Staffer[] public staffList;

    function stringToBytes32(string memory source)
        public
        pure
        returns (bytes32 result)
    {
        bytes memory tempEmptyStringTest = bytes(source);
        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }
        assembly {
            result := mload(add(source, 32))
        }
    }

    function addStaff(
        string memory _name,
        uint256 _id,
        string memory _jobTitle
    ) public {
        //Method 1
        //staffList.push(Staffer(_name, _id, _jobTitle));

        //Method 2
        bytes32 nameBytes = stringToBytes32(_name);
        bytes32 jobTitleBytes = stringToBytes32(_jobTitle);

        staffList.push(
            Staffer({name: nameBytes, staffID: _id, jobTitle: jobTitleBytes})
        );

        //Method 3
        Staffer memory staffX;
        staffX.name = "James";
        staffList.push(staffX);
    }

    //Update Staff
    function updateStaff(
        uint256 _id,
        bytes32 _jobTitle,
        uint8 index
    ) public {
        Staffer storage staffZ = staffList[index];
        staffZ.jobTitle = _jobTitle;
        staffZ.staffID = _id;
    }
}
