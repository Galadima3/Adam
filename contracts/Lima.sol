// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Lima {
    struct UserStruct {
        string name;
        uint256[2] nums;
    }

    function encode(
        uint256 x,
        address _addr,
        uint256[] calldata array,
        UserStruct calldata user
    ) external pure returns (bytes memory) {
        return abi.encode(x, _addr, array, user);
    }

    function decode (bytes calldata data) external pure returns ( uint256 x,
        address _addr,
        uint256[] memory array,
        UserStruct memory user){
            return  abi.decode(data, (uint256, address, uint256[], UserStruct));
        }
}
