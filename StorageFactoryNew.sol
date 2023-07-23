// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

    // import whole file
//import "./SimpleStorage.sol";

    // import specific contrcat from file
import {SimpleStorage} from "./SimpleStorage.sol";

    // import mutiple contrcat from file
//import {SimpleStorage2, SimpleStorage3} from "./SimpleStorage.sol";

contract StorageFactory{
        SimpleStorage[] public listOfSimpleStorage;
    //  ContractName public VairbaleName;

    function createSimpleStorgaeContract()public{

        SimpleStorage newSimpleStorageContract = new SimpleStorage(); //Contract Deploment
        listOfSimpleStorage.push(newSimpleStorageContract);

    //  VaribaleName = new ContractName
    //  new keyword tell the compiler to deploy the comptract
    }

    function sfStore(uint _simpleStorageIndex, uint _newSimpleStorageNumber) public {
        SimpleStorage mySimpleStorage = listOfSimpleStorage[_simpleStorageIndex];
        mySimpleStorage.store(_newSimpleStorageNumber);
        
    }
    function sfGet(uint _simpleStorageIndex) public view returns(uint256){
        SimpleStorage mySimpleStorage = listOfSimpleStorage[_simpleStorageIndex];
        return mySimpleStorage.retrieve();
    }


}

// calling the createSimpleStorage Funtion whihc creates a newSimpeStorageContract
// everytime its called, of datatype SimpleStorgae which we imported from SimpleStorage.sol
// pusesh the contract or adddresses of the contract to list of simple storgae contracts
// that we created, now when we call the s4Store fucntion and give him paparemeter,
// index of contract & number to save, it creates a new contract and import info from list using index,
// call its store function and store number into it, simlilary use retrieve function to read.
