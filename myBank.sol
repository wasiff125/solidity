// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract myBank {
    
    struct Customer{
        string name;
        uint age;
    }
    

    Customer[] public WasifBank;
    mapping(string => uint) public NameToAge;

    function addCustomer(string memory _name, uint _age)public
    {
        WasifBank.push(Customer({name: _name, age: _age}));
        NameToAge[_name] = _age;
    }


}
