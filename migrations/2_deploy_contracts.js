const CToken = artifacts.require("./CToken.sol");

module.exports = function (deployer) {
  deployer.deploy(CToken);
};
