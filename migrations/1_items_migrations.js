var gameToken = artifacts.require('gameItems')

module.exports = deployer => deployer
    .then( () => deployToken(deployer));

function deployToken(deployer){
    return deployer.deploy(gameToken)
}

