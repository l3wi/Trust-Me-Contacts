// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "solmate/tokens/ERC721.sol";
import "trustus/Trustus.sol";

error DoesNotExist();

/////////////// TRUST ME //////////////////////
// Trust Me is an NFT project mintable via  /// 
// an trusted external oracle. Ensures one  ///
// mint if payload is unique.               ///
///////////////////////////////////////////////

contract TrustMe is ERC721, Trustus {
    uint256 public totalSupply; // Current Supply
    string public baseURI; // URI for the token

    constructor(
        string memory name,
        string memory symbol,
        string memory _baseURI,
        address signer
    ) ERC721(name, symbol) {
        baseURI = _baseURI;
        _setIsTrusted(signer, true);
    }

    mapping(bytes => bool) internal hasMinted; // list of previously minted payloads

    function mint(bytes32 request, TrustusPacket calldata packet) external verifyPacket(request, packet) {
        require(!hasMinted[packet.payload], 'Already minted');   // Check if the packet has been used previously

        _mint(msg.sender, totalSupply++);                       // Mint NFT to sender

        hasMinted[packet.payload] = true;                       // Save mint action
    }

    function tokenURI(uint256 id) public view override returns (string memory) {
        if (ownerOf[id] == address(0)) revert DoesNotExist();
        return string(abi.encodePacked(baseURI, id));
    }

     function supportsInterface(bytes4 interfaceId)
        public
        pure
        override(ERC721)
        returns (bool)
    {
        return
            interfaceId == 0x80ac58cd || // ERC165 Interface ID for ERC721
            interfaceId == 0x5b5e139f || // ERC165 Interface ID for ERC165
            interfaceId == 0x01ffc9a7; // ERC165 Interface ID for ERC721Metadata
    }

}
