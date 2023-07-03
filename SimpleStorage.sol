// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

//importing the SimpleStorage.sol contrat to Simple Storage contract
import "./SimpleStorage.sol";

contract StorageFactory{
//deploying myBank contrcat through StorageFactory Contract 

    SimpleStorage[] public SimpleStorageArray;

    /* 
    cause this is public function, we can call it many times and we puch its button
    each time a new contract will be deployed, and everytime it will be added to the 
    SimpleStorageArray like happeing in line 27, and explained in its above cmmnt.

    */
    function createNewSimpleStorage()public
    {
        //just creating like an object of class/C  contract SimpleStorage.sol
        //to interact with it, deploaay, read and write on it.
        SimpleStorage Wasif = new SimpleStorage();

        //pushing or appending to the contract we deployed to SimpleStorageArray
        //we can deploy the SimpleStorage contract mutlitple times and each time
        //it will be added to opur array.
        SimpleStorageArray.push(Wasif);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _FavoriteNumber)public{
        SimpleStorage Wasif = SimpleStorage(address(SimpleStorageArray[_simpleStorageIndex]));
        Wasif.store(_FavoriteNumber);
    }

    function sfRetreive(uint _simpleStorageIndex)public view returns(uint256){
        SimpleStorage Wasif = SimpleStorage(address(SimpleStorageArray[_simpleStorageIndex]));
        return Wasif.retrieve();
    }

}
