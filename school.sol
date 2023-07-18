// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

contract school{
    struct Student{
        uint256 roll;
        string name;
        int class;
    }

    Student[] public makWay;                             //dynamic array, like list data type is pyhton, but it does not support multiple data types for one array.

    mapping(uint256 => string) public rollToName;        //mapping is like dictinary data type used in pyhton.

    function addStudent(uint256 _roll, string memory _name, int _class) public{
        makWay.push(Student(_roll, _name, _class));     //adding new student in the array, using push function of solidity also used in other high level languages.
        rollToName[_roll] = _name;                      //mapping the roll no with name, so we can find student name easily by only giving his roll no.
    }

}
