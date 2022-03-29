pragma solidity ^0.8.0;

contract CToken{
    uint256 public totalSupply;
    string public name="BigC";
    string public abv="BC";
    //constructor
    //set the tokens 
    //read total number of tokens
  constructor() public{
      totalSupply = 10000;

    }
}