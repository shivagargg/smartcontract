//SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
import {PriceConverter} from "./PriceConverter.sol";
//====================================================================================

error NotOwner() ;
contract FundMe {
using PriceConverter for uint256;
// constant saves gas naming convension all caps
        uint256 public constant minimumusd= 5 * 1e18;
        // blockchain oracle: winteract iwth offchain world to provide 
        //external data or computation to smart contra cts

    address[] public funders;
    mapping(address funder => uint256 amountfunded ) public addresstoamountfunded;
// single use use immutable to save gas : naming convension i_owner below-
    address public immutable owner;
    constructor(){
        owner=msg.sender;
    }
   // uint256 public myvalue =1;
    function fund () public payable { 
        //myvalue= myvalue+2; if failed will revert but gas is spent upto what it run
        // allow userrs to send $ , minim $ spent , how to send eth in this contract
        require(msg.value.getConversionRate() >= minimumusd , "Please give a enough amount"); 
        funders.push(msg.sender);
        addresstoamountfunded[msg.sender] = addresstoamountfunded[msg.sender] + msg.value ;
        //msg.sender and msg.value are glocbal units fpr value and address 
    }
   function withdraw() public onlyOwner{
  //  require(msg.sender== owner , "must be owner ");


   //loop
   for (uint256 funderIndex=0;funderIndex<funders.length;funderIndex++){
    address funder = funders[funderIndex];
    addresstoamountfunded[funder]=0; 
   }
   //reeset the array
   funders = new address[](0);
   //withdrawing now 
   // transfer , send , call
   payable(msg.sender).transfer(address(this).balance);
   // msg.payer and this are global units for value and address
   bool sendsuccess=payable(msg.sender).send(address(this).balance);
   require(sendsuccess,"failed to send ether");
//call can leave datareturned fo now 
   (bool callsuccess , )=payable(msg.sender).call{value:address(this).balance}("");
    require(callsuccess,"failed to call");
    
  
   }
   modifier onlyOwner(){
     //require(msg.sender== owner , "must be owner ");
     if(msg.sender != owner ){revert NotOwner();} // saves gas custom error code
    _;
    //_; btara h code before line ya after line execute ho currently after require;
   }
   //receive ()
   //callback()
   receive() external payable { 
    fund();
   }
   fallback() external payable { 
    fund(); //auto route to fund
   }

}