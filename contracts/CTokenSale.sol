// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;
import "./CToken.sol";

contract CTokenSale{
    address admin; 
    CToken public tokenContract;
    uint256 public tokenPrice;
    uint256 public tokenSold;
    event Sell( address _buyer, uint256 _amount);
   
    constructor(CToken _tokenContract, uint256 _tokenPrice) public{
       admin = msg.sender;
       tokenContract= _tokenContract;
       tokenPrice = _tokenPrice;
   }

    function multiply(uint x, uint y) internal pure returns (uint z){
        require(y==0 || (z= x*y)/y ==x);
    }

    function buyTokens(uint256 _numberofTokens) public payable{
        require(msg.value == multiply(_numberofTokens, tokenPrice));
        require(tokenContract.balanceof(this)>= _numberofTokens);
         
        tokenSold += _numberofTokens;
       emit Sell(msg.sender, _numberofTokens);
    }
}