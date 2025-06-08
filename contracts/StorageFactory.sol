//SPDX-License-Identifier:MIT
pragma solidity ^0.8.19; // this is the solidity version
import "./SimpleStorage.sol";
contract StorageFactory{
    SimpleStorage[] public ListOfSimpleStorage;
    function createSimpleStorageContract() public {
        // how does the storage factory know what simple storage looks like?
        SimpleStorage newSimpleStorage =new SimpleStorage();
        ListOfSimpleStorage.push(newSimpleStorage);
    }
    function sfStroe (uint256 _SimpleStorageIndex, uint256 _newSimpleStorageNmber) public {
        //address
        //abi- app binary interface
    }
}