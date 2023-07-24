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

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function fund() public payable{
        require(getConversionRate(msg.value) >= miniumUSD);

        funders.push(msg.sender);
        //pushing all the address to funder array to keep the track
        addressToAmountFunded[msg.sender]= addressToAmountFunded[msg.sender] + msg.value;
    }

    function withdraw() public onlyOwner {
        /*created for loop, initialed funderIndex variable of uint256 datatype, 
        funder should always be greater than total addresses int the funders array,
        so that the only condition when its true for loop is breaked,
        for example our array has total five addresses, and fundersIndex value 
        reaches 6 so the lopp will be breaked here*/
        for(uint256 funderIndex=0; funderIndex < funders.length; funderIndex++){
            /*we create a variable named funder having datatype address, which is equal to
            funders array and its index in large brackerts, to grab the addresses by index,
            one by one*/
            address funder = funders[funderIndex] ;
            /*after grabbing the address from array in variable funder, we give it to,
            mapping addressToAmount and we maek that amount zero*/
            addressToAmountFunded[funder] = 0;


            //clearing the array 
            funders = new address[](0);

            // there are three ways to withdraw/send money in solidity

            //1. transfer 
            //payable(msg.sender).transfer(address(this).balance);
            //2. send <returns bool>
            //bool sendSuccess = payable(msg.sender).send(address(this).balance);
            //require(sendSuccess, "send failed");
            //3. call (recommended) <returns bool, data of datatype bytes>
            (bool callSuccess,) = payable(msg.sender).call{value: (address(this).balance)}("");
            require(callSuccess, "call failed");



        }
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
    
  
    modifier onlyOwner(){
        require(msg.sender == owner, "sender is not owner");
        _;
    }
}
