// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract SimpleStorage{

    uint256 myFavouriteNumber;

    struct Person{
        uint favouriteNumber;
        string name;
    }

    Person[] public listOfPeople;

    mapping(string => uint256) public nameToFavNumber;

    function store(uint _favouriteNumber,string memory name) public{
       listOfPeople.push(Person(_favouriteNumber,name));
        nameToFavNumber[name] = _favouriteNumber;
        // myFavouriteNumber = 78940136259u24;
    }
    
    function retrieve()public view returns(uint){
        return myFavouriteNumber;
    }

}