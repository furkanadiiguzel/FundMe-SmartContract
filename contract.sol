// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe{
    uint256 public minimumUSD = 50 * 1e18; // 1 *10 **18 

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    function fund() public payable{
        //we want be able to set a minimmum fund amount in USD
        //1. How do we send ETH to this contract
        require(getConversionRate(msg.value) >= minimumUSD,  "Didn't send enough");
        //18 decimals here
        funders.push(msg.sender);
        //revert
    }
    function getPrice() public view returns(uint256)
    {
         AggregatorV3Interface priceFeed = AggregatorV3Interface(0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419);
        (, int256 price,,,) = priceFeed.latestRoundData();
        //ETH in terms of USD
        return uint256(price * 1e10);
    }
    
    function getVersion() public view returns(uint256)
    {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419);
        return priceFeed.version();

    }

    function getConversionRate(uint256 ethAmount) public view returns(uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUSD = (ethPrice*ethAmount) / 1e18 ;
        return ethAmountInUSD;

    }

     
    
    //function wihdraw(){ }
}
