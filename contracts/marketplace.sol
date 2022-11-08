pragma solidity ^0.8.0;
import "../node_modules/@openzeppelin/contracts/token/ERC1155/IERC1155.sol";

contract Marketplace {
    IERC1155 private _token;
    mapping(uint256 => uint256) private _prices;

    constructor(address _tokenAddress) {
        _token = IERC1155(_tokenAddress);
        _prices[1] = 1e14;
        _prices[2] = 1e14;
        _prices[3] = 1e14;
    }

    function buyToken(uint256 tokenId) public payable {
        require(
            msg.value >= _prices[tokenId] && _prices[tokenId] != 0,
            "eth<price"
        );
        _token.safeTransferFrom(address(this), msg.sender, tokenId, 1, "");
    }

    fallback() external payable {
        buyToken(1);
    }

    function onERC1155Received(
        address _operator,
        address _from,
        uint256 _id,
        uint256 _value,
        bytes32 _data
    ) public view returns (bytes4) {
        return
            bytes4(
                keccak256(
                    "onERC1155Received(address _operator, address _from, uint256 _id, uint256 _value, bytes32 calldata _data)"
                )
            );
    }
}
