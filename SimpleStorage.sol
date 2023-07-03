//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract SimpleStorage
{
    uint256 public FavoriteNumber;

    function store(uint256 _FavoriteNumber)public
    {
        FavoriteNumber = _FavoriteNumber; 
    }

    function retrieve() public view returns(uint256)
    {
        return FavoriteNumber;
    }
}
