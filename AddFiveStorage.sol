// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

// <is> keyword is use for inheritance here, 
contract AddFiveStorage is SimpleStorage{

// only viurtual funcitons can be overriden, in parent contract the function should
// have <virtual> keyword, so we can <override> it in child contract.

    function store(uint256 _newNumber) public override {
        uint256 x = 5;
        myfavoriteNumber = _newNumber + x;
    }
}

