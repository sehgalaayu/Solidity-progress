# FundMe Smart Contrac

This is a simple smart contract for **funding** with **ETH** based on real-time **price feed data** from **Chainlink**.  
It allows users to send ETH if the amount meets a **minimum USD value** requirement, and lets the **owner** withdraw the collected funds.

---

## 📚 What I Learned

- **Solidity Basics**: Structuring a contract with constructor, functions, modifiers, and state variables.
- **Chainlink Price Feeds**: Integrated `AggregatorV3Interface` to fetch live ETH/USD prices.
- **Price Conversion Library**: Used an external `PriceConverter` library to convert ETH amount to USD.
- **Gas Optimization**:
  - Used `constant` and `immutable` keywords to optimize gas usage.
- **Error Handling**:
  - Created a custom error `NotOwner()` for efficient error management instead of using string messages.
- **Access Control**:
  - Implemented `onlyOwner` modifier to restrict withdrawal function to the owner only.
- **Sending ETH**:
  - Practiced different ways to send ETH: `transfer`, `send`, and `call`.  
  - Used `call` method as it's the most flexible and recommended.
- **Fallback and Receive Functions**:
  - Implemented both `fallback()` and `receive()` functions to handle direct ETH transfers to the contract.
- **Mappings and Arrays**:
  - Used `mapping` to track how much each address has funded.
  - Stored funders' addresses in an array for easier management during withdrawals.

---

## 🔧 How It Works

- **Fund Functionality**:
  - Users call `fund()` and must send enough ETH to meet the `MINIMUM_USD` threshold.
- **Withdraw Functionality**:
  - Only the contract owner can call `withdraw()`, resetting all funders' balances and transferring the ETH to the owner.
- **Fallback and Receive**:
  - Automatically call `fund()` if ETH is sent directly without specifying a function.

---

## 🛠 Technologies Used

- **Solidity** `^0.8.18`
- **Chainlink** for live price feeds
- **Hardhat/Foundry** (recommended for testing and deployment)

---

## 🧠 Important Notes

- `i_owner` is declared as **immutable** to save gas.
- `MINIMUM_USD` is a **constant** value (5 USD worth of ETH).
- Instead of plain `require` error messages, **custom errors** are used for better gas optimization.
- `call` is used for ETH transfers because `transfer` and `send` are limited to 2300 gas and are not future-proof.

---

## 📂 Files

- `FundMe.sol` — main smart contract.
- `PriceConverter.sol` — external library for ETH to USD price conversion.
- Chainlink `AggregatorV3Interface` is imported for fetching live price data.
