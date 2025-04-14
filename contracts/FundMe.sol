// SPDX-License-Identifier: MIT

// Overview to make smart contract:
// - Get funds from users
// - Withdraw funds from contract
// - Set a min funding value in USD

pragma solidity ^0.8.19;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    uint256 public constant MINIMUM_USD = 5 * 1e18; // Minimum USD value (with 18 decimal precision)

    // Address of ETH/USD Chainlink price feed on Sepolia testnet (example)
    address public constant PRICE_FEED_ADDRESS = 0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43;

    function fund() public payable {
        require(getConversionRate(msg.value) >= MINIMUM_USD, "You need to spend more ETH!");
        // Logic to track who sent how much can be added later
    }

    // Get ETH price in USD with 18 decimals
    function getPrice() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(PRICE_FEED_ADDRESS);
        (, int256 answer,,,) = priceFeed.latestRoundData();
        return uint256(answer * 1e10); // Convert price from 8 to 18 decimals
    }

    // Convert ETH amount to USD equivalent
    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }

    // function withdraw() public {
    //     // Will be added later
    // }
}
