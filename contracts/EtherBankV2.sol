// SPDX-License-Identifier:MIT
pragma solidity ^0.8.9;

contract EtherBank {
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    function deposit() public payable{}

    function withdraw(address _to,uint _amount) public{
        require(msg.sender == owner);                   // Prefer msg.sender in most cases instead of tx.origin
        (bool sent,) = _to.call{value:_amount}("");
        require(sent,"Failed to send Ether.");
    }
}
