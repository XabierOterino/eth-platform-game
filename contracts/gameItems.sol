pragma solidity ^0.8.0;
import "../node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract gameItems is ERC1155 {
    address private _owner;

    constructor() ERC1155("") {
        _owner = msg.sender;
    }

    function mint(
        address to,
        uint256 id,
        uint256 amount
    ) public {
        require(msg.sender == _owner, "ONLY_OWNER");
        _mint(to, id, amount, "");
    }
}
