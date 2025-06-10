//SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;
contract FallbackExample {
    uint256 public result ;

    receive() external payable {   
        result ++;

    }
    // fallback fn 
    fallback() external payable { 
        result=2;
        //if no data given in call data if someone sends money without info
    }

}