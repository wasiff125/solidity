// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract SimpleStorage{
    uint256 myfavoriteNumber;

    // uint256[] ListOfFavoriteNumber;
    // Dynamic Array
    struct Person{
        uint256 FavoriteNumber;
        string name;
    }

    // Person public WMA = Person(7,"wasiff");
    // Person public UZ = Person(8,"Umer");
    // Person public FF = Person(9,"Farhan");

    Person[] public listOfPeople;
    mapping(string => uint256) public nametoFavoriteNumber;


    function store(uint256 _favoriteNumber) public {
        myfavoriteNumber = _favoriteNumber;
    }
    function retrieve() public view returns(uint256){
        return myfavoriteNumber;
    }

    function addPerson(uint256 _favoriteNumber, string memory _name)public{
        //Person memory newPerson = Person(_favoriteNumber, _name);
        //Originally its s done like this but we can also do it directly like below line
        listOfPeople.push(Person(_favoriteNumber, _name));
        nametoFavoriteNumber[_name] = _favoriteNumber;
    }

}


