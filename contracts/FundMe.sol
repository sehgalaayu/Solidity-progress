// SPDX-License-Identifier: MIT

//overview to make smart contract:
//- Get funds from users
//- Withdraw funds from contract
//- set a min funding value in USD

pragma solidity ^0.8.19;

contract FundMe {   
    function fund() public payable{
        require(msg.value>1e18,"you need to send more than 1 ether");// 1e18 = 1 ETH = 1 * 10 ** 18wei
    }

    // function withdraw() public{

    // }

}
