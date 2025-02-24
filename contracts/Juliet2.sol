// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Sender {
    event Response(bool success, bytes data);

    function callFoo(address payable _extAddr) public payable {
        /*
        (bool success, bytes memory data) = _extAddr.call{
            value: msg.value,
            gas: 5000
        }(abi.encodeWithSignature("foo(strng,uint256)", "Call Mike", 500));
        */

        // Use function selector
        (bool success, bytes memory data) = _extAddr.call{
            value: msg.value,
            gas: 5000
        }(
            abi.encodeWithSelector(
                bytes4(keccak256("foo(strng,uint256)")),
                "Call Saul",
                500
            )
        );
        emit Response(success, data);
    }

    function callGhost(address payable _addr) public payable {
        (bool success, bytes memory data) = _addr.call{value: msg.value}(
            abi.encodeWithSignature("doesNotExist()")
        );

        emit Response(success, data);
    }
}
