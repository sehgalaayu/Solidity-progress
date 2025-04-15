// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConvertor{
 address public constant PRICE_FEED_ADDRESS = 0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43;
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

}
