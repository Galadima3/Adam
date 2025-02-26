// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Mike {
    function hash(string memory _text, uint256 _num, address _addr) public pure returns (bytes32){
        return keccak256(abi.encodePacked(_text, _num, _addr));
    }

     function collision(string memory _text, string memory _anotherText)
        public
        pure
        returns (bytes32)
    {
        // encodePacked(AAA, BBB) -> AAABBB
        // encodePacked(AA, ABBB) -> AAABBB
        // abi.encode when dealing with multiple dynamic types
        return keccak256(abi.encodePacked(_text, _anotherText));
    }

}