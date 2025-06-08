//SPDX-License-Identifier:MIT
pragma solidity ^0.8.19; // this is the solidity version
import {SimpleStorage} from"./SimpleStorage.sol"; 

contract AddFiveStorage is SimpleStorage { //inheritied
   // +5\
   function store (uint256 _number) public override     {
    myfavnumber= _number + 5;
   }
}