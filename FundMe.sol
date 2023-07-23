// SPDX-License-Identifier: MIT

// get funds from user
// withdraw funds
// set minimum funds 

// 1 ether = 1^18 = 1000000000000000000 
pragma solidity ^0.8.18;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
//IMPORTING FROM GITHUB 

contract FundMe{


    uint256 public miniumUSD = 5 * 1e18 ;

    address[] public funders;
    //to keep track who is sending us money

    mapping (address funder => uint256 amountFunded) public addressToAmountFunded;

    function fund() public payable{
        require(getConversionRate(msg.value) >= miniumUSD);

        funders.push(msg.sender);
        //pushing all the address to funder array to keep the track
        addressToAmountFunded[msg.sender]= addressToAmountFunded[msg.sender] + msg.value;
    }

    function getPrice() public view returns(uint256){
        //address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        //ABI 

        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int256 price,,,) = priceFeed.latestRoundData();  
        // will return ETH in usd
        return uint256(price * 1e10);  
    }

    function getConversionRate(uint256 ethAmount) public view returns(uint256){
        uint256 ethPrice = getPrice();
        // 1894066235420000000000
        uint256 ethAmountInUSD = (ethPrice * ethAmount)/1e18;
        //  1894066235420000000000 * 1000000000000000000 / 1e18
        // $1,893.90 = 1ETH
        return ethAmountInUSD;
    }
    
  

}
