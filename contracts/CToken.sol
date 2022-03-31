pragma solidity ^0.8.0;

contract CToken{
    uint256 public totalSupply;
    string public name="BigC Token";
    string public symbol="BC";
    string public standard = "BC v1.01";
    //constructor
    //set the tokens 
    //read total number of tokens

    mapping(address => uint256) public balanceof;
  constructor(uint256 _initialSupply) public{
    balanceof[msg.sender]=_initialSupply;
    totalSupply = _initialSupply;
  //allocate the initial supply to 1 address
    }

    //trnasfer
    function transfer(address _to, uint256 _value) public returns(bool success){
      require(balanceof[msg.sender] >= _value);
    }
}