var Token = artifacts.require("gameItems")
var Marketplace = artifacts.require('Marketplace')

module.exports = deployer => deployer
    .then( () => deployToken(deployer));

function deployMarketplace(deployer){
    return deployer.deploy(Marketplace, Token.address)
}

