# FundMe Smart Contract Documentation

## Overview

The FundMe smart contract is designed to allow users to contribute Ether (ETH) to a crowdfunding campaign. The contract enforces a minimum funding amount in USD and uses Chainlink's price feed to determine the ETH to USD conversion rate.

## Smart Contract Details

### State Variables

- **`minimumUSD`**: The minimum amount in USD that must be contributed to the campaign. Default is set to 50 ETH.
- **`funders`**: An array containing the addresses of users who have contributed to the campaign.
- **`addressToAmountFunded`**: A mapping that tracks the amount each funder has contributed.

### Functions

- **`fund()`**: Allows users to contribute funds to the campaign. Requires the sent amount to meet the minimum USD requirement.
- **`getPrice()`:** Retrieves the latest ETH to USD conversion rate using Chainlink's AggregatorV3Interface.
- **`getVersion()`:** Retrieves the version of the Chainlink AggregatorV3Interface being used.
- **`getConversionRate(uint256 ethAmount)`:** Calculates the equivalent USD amount for the provided ETH amount.

## Usage

1. **Setting Minimum Contribution Amount:**
   - The `minimumUSD` variable can be adjusted to set the minimum contribution amount in USD.

2. **Contributing Funds:**
   - Users can contribute funds by calling the `fund()` function, ensuring they send the required ETH amount to meet the minimum USD requirement.

3. **Viewing Conversion Rate:**
   - The `getPrice()` function provides the latest ETH to USD conversion rate.

4. **Viewing Contract Version:**
   - The `getVersion()` function retrieves the version of the Chainlink AggregatorV3Interface.

5. **Viewing Conversion Rate for a Specific ETH Amount:**
   - The `getConversionRate(uint256 ethAmount)` function calculates the equivalent USD amount for a given ETH amount.

## Example

```solidity
// Example: Contributing 2 ETH to the FundMe contract
contract.fund({value: 2 * 1e18});

// Example: Retrieving the latest ETH to USD conversion rate
uint256 ethToUsdRate = contract.getPrice();

// Example: Retrieving the version of the Chainlink AggregatorV3Interface
uint256 version = contract.getVersion();

// Example: Calculating USD equivalent for 2 ETH
uint256 usdEquivalent = contract.getConversionRate(2 * 1e18);
```

## Notes

- Ensure that the Chainlink AggregatorV3Interface contract address (0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419) remains up-to-date.
- Additional functions, such as withdrawal, can be implemented based on project requirements.

Feel free to extend and customize the contract as needed for your specific use case.
