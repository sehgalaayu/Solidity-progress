// SPDX-License-Identifier: MIT

// Overview to make smart contract:
// - Get funds from users
// - Withdraw funds from contract
// - Set a min funding value in USD

pragma solidity ^0.8.19;
import {PriceConverter} from "./PriceConverter.sol";
using PriceConverter for uint256;

contract FundMe {

    uint256 public constant MINIMUM_USD = 5 * 1e18; // Minimum USD value (with 18 decimal precision)
    address[] public  funders;
    mapping(address funder =>uint256 amountFunded) addressToAmountFunded;
    // Address of ETH/USD Chainlink price feed on Sepolia testnet (example)
   

    function fund()  internal payable {
        require(msg.value.getConversionRate() >= MINIMUM_USD, "You need to spend more ETH!");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender]+= msg.value;

    }


    // function withdraw() public {
    
    // }
}
