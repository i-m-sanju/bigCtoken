const CToken = artifacts.require("./CToken.sol");
const CTokenSale = artifacts.require("./CTokenSale.sol");

module.exports = function (deployer) {
  deployer.deploy(CToken, 1000).then(function(){
    var tokenPrice = 1000000000000000;
    return deployer.deploy(CTokenSale, CToken.address, tokenPrice);
  });
 
};
