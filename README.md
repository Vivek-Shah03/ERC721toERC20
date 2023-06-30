**Description:** ERC721 and ERC20 Smart Contract Integration. Your task is to create a smart contract that integrates two Ethereum token standards: ERC721 and ERC20. The goal is to establish a mapping between ERC721 tokens and ERC20 tokens, where each ERC721 token is associated with 1000 ERC20 tokens.

**Smart Contract Documentation:**

- **ERC721Token:**

The `ERC721Token` contract is an implementation of the ERC721 standard, which represents non-fungible tokens (NFTs) on the Ethereum blockchain. It inherits from the `ERC721` contract provided by the OpenZeppelin library. This contract allows users to mint ERC721 tokens with a specified token ID.

**Functions**

Constructor:

The constructor function initializes the ERC721 token with a name and symbol. In this case, the name is set to "VivekERC721" and the symbol is set to "ERC721".

mint(address to, uint256 tokenId) external:

The `mint` function allows the contract owner to mint a new ERC721 token and assign it to a specified address (`to`). The token is created with the given `tokenId`.

- **ERC20Token:**

The `ERC20Token` contract is an implementation of the ERC20 standard, which represents fungible tokens on the Ethereum blockchain. It inherits from the `ERC20` contract provided by the OpenZeppelin library. This contract allows users to mint ERC20 tokens with a specified amount.

**Functions**

Constructor:

The constructor function initializes the ERC20 token with a name and symbol. In this case, the name is set to "VivekERC20" and the symbol is set to "ERC20".

mint(address to, uint256 amount) external:

The `mint` function allows the contract owner to mint new ERC20 tokens and transfer them to a specified address (`to`). The amount of tokens to be minted is specified by the `amount` parameter.

- **TokenMapping:**

The `TokenMapping` contract facilitates the mapping between ERC721 tokens and ERC20 tokens. It allows users to associate an ERC721 token with a specific amount of ERC20 tokens using a predefined token ratio.

**Constants**

TOKEN\_RATIO:

The `TOKEN\_RATIO` constant represents the conversion rate between ERC721 tokens and ERC20 tokens. In this contract, 1 ERC721 token is mapped to 1000 ERC20 tokens.

**Variables**

erc721Token:

An instance of the `ERC721Token` contract used for interacting with ERC721 tokens.

erc20Token:

An instance of the `ERC20Token` contract used for interacting with ERC20 tokens.

erc721ToErc20:

A mapping that associates an ERC721 token ID with the corresponding amount of ERC20 tokens it is mapped to.

**Events:**

TokensMapped(uint256 indexed erc721TokenId, uint256 erc20TokenAmount):

This event is emitted when an ERC721 token is successfully mapped to a specific amount of ERC20 tokens. It includes the ERC721 token ID and the corresponding ERC20 token amount.

**Constructor:**

constructor(address erc721TokenAddress, address erc20TokenAddress):

The constructor function initializes the `TokenMapping` contract by providing the addresses of the ERC721 token contract and the ERC20 token contract. It creates instances of these contracts for further interactions.

**Functions:**

mapTokens(uint256 erc721TokenId) external:

The `mapTokens` function allows a user to map an ERC721 token to a specific amount of ERC20 tokens. The user must own the ERC721 token and it must not be already mapped to ERC20 tokens. Once the mapping is successful, the ERC20 tokens are minted and transferred to the user's address.

getERC20TokenAmount(uint256 erc721TokenId) external view returns (uint256):

The `getERC20TokenAmount` function allows users to retrieve the amount of ERC20 tokens associated with a specific ERC721 token. It takes the ERC721 token ID as input and returns the corresponding ERC20 token amount.



- **Usage:**

To use the smart contracts, you need to follow these steps:

1\. Deploy the `ERC721Token` contract, providing a name and symbol for the ERC721 token.

2\. Deploy the `ERC20Token` contract, providing a name and symbol for the ERC20 token.

3\. Deploy the `TokenMapping` contract, providing the addresses of the deployed ERC721 and ERC20 token contracts.

4\. Interact with the `TokenMapping` contract:

- Call the `mapTokens` function, providing the ERC721 token ID you want to map. Make sure you are the owner of the ERC721 token and it is not already mapped.

- Call the `getERC20TokenAmount` function, providing the ERC721 token ID, to retrieve the amount of ERC20 tokens associated with the ERC721 token.
