var gameToken = artifacts.require('gameItems')
var Marketplace = artifacts.require('Markatplace')

module.exports = async deployer => {
    await deployer.deployer(gameToken)
    const tokens = await gameToken.deployed()
    await deployer.deploy(Marketplace, tokens.address)
    const market = await Marketplace.deployed()
    await tokens.mint(market.address, '1','999999999999999999999999999');
    await tokens.mint(market.address, '2','999999999999999999999999999');
    await tokens.mint(market.address, '3','999999999999999999999999999');

}

