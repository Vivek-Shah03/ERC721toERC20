// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ERC721Token is ERC721 {
    constructor() ERC721("VivekERC721", "ERC721") {}

    function mint(address to, uint256 tokenId) external {
        _mint(to, tokenId);
    }
}

contract ERC20Token is ERC20 {
    constructor() ERC20("VivekERC20", "ERC20") {}

    function mint(address to, uint256 amount) external {
        _mint(to, amount);
    }
}

contract TokenMapping {
    ERC721Token private erc721Token;
    ERC20Token private erc20Token;
    uint256 private constant TOKEN_RATIO = 1000;

    mapping(uint256 => uint256) private erc721ToErc20;

    event TokensMapped(uint256 indexed erc721TokenId, uint256 erc20TokenAmount);

    constructor(address erc721TokenAddress, address erc20TokenAddress) {
        erc721Token = ERC721Token(erc721TokenAddress);
        erc20Token = ERC20Token(erc20TokenAddress);
    }

    function mapTokens(uint256 erc721TokenId) external {
        require(
            erc721Token.ownerOf(erc721TokenId) == msg.sender,
            "You must own the ERC721 token"
        );
        require(
            erc721ToErc20[erc721TokenId] == 0,
            "ERC721 token already mapped to ERC20 tokens"
        );

        uint256 erc20TokenAmount = TOKEN_RATIO;
        erc721ToErc20[erc721TokenId] = erc20TokenAmount;

        erc20Token.mint(msg.sender, erc20TokenAmount);

        emit TokensMapped(erc721TokenId, erc20TokenAmount);
    }

    function getERC20TokenAmount(uint256 erc721TokenId)
        external
        view
        returns (uint256)
    {
        return erc721ToErc20[erc721TokenId];
    }
}
