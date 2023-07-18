// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

contract school{
    struct Student{
        uint256 roll;
        string name;
        int class;
    }

    Student[] public makWay;

    mapping(uint256 => string) public rollToName;

    function addStudent(uint256 _roll, string memory _name, int _class) public{
        makWay.push(Student(_roll, _name, _class));
        rollToName[_roll] = _name;
    }

}
