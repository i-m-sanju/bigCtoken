// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract CToken{
    uint256 public totalSupply;
    string public name="BigC Token";
    string public symbol="BC";
    string public standard = "BC v1.01";
    //constructor
    //set the tokens 
    //read total number of tokens

    event Transfer(
      address indexed _from, address indexed _to, uint256 _value
    );

    event Approval(
      address indexed _owner,
      address indexed _spender,
      uint256 _value
    );

    mapping(address => uint256) public balanceof;
    mapping(address => mapping(address => uint256)) public allowance;
              //I               account b    t approved
  
  
  constructor(uint256 _initialSupply) public{
    balanceof[msg.sender]=_initialSupply;
    totalSupply = _initialSupply;
  //allocate the initial supply to 1 address
    }

    //trnasfer
    function transfer(address _to, uint256 _value) public returns(bool success){
      require(balanceof[msg.sender] >= _value);
      //transfer money
      balanceof[msg.sender] -= _value;
      balanceof[_to] += _value;

      //transfer event
      emit Transfer(msg.sender, _to, _value);

      return true;

    } 

    //delegated transfer : useful for exchanges like you allow an exchange to sell your token on your behalf and you just have to approve the txn

    //approve function

    function approve(address _spender, uint256 _value) public returns (bool success){
      allowance[msg.sender][_spender] = _value;
      
      emit Approval(msg.sender, _spender, _value);
      


      return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){

      //Require _from has enough token
      require(_value <= balanceof[_from]);
      //require allowance to be big enough to transfer funds
      require(_value <= allowance[_from][msg.sender]);
      //change balance
      balanceof[_from] -= _value;
      balanceof[_to] += _value;
      //update allowance

      allowance[_from][msg.sender] -= _value;
      //transfer event

       emit Transfer(_from, _to, _value);
      // return boolean 

      return true;
    }

}