// contracts/STEPNNFT.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import '@openzeppelin/contracts/utils/Strings.sol';

/**
 * PARTYBOARD NFTs
 * @author PARTYBOARD
 */
contract PARTYBOARDNFT is ERC721Enumerable, Ownable {
    // base uri for nfts
    string private _buri;

    constructor() ERC721("PARTYBOARDNFT", "PBNFT") {}

    /**
     * @dev Returns an URI for a given token ID
     */
    function tokenURI(uint256 _tokenId) override public view returns (string memory) {
        if (!_exists(_tokenId)) return "";
        return string(abi.encodePacked(_buri, Strings.toString(_tokenId), ".json"));
    }
    function _baseURI() internal view override returns (string memory) {
        return _buri;
    }

    function setBaseURI(string memory buri) public onlyOwner {
        require(bytes(buri).length > 0, "wrong base uri");
        _buri = buri;
    }

    function mint(address to, uint256 tokenId) public onlyOwner {
        _safeMint(to, tokenId);
    }

    function burn(uint256 tokenId) public virtual {
        require(
            _isApprovedOrOwner(_msgSender(), tokenId),
            "burn caller is not owner nor approved"
        );
        _burn(tokenId);
    }
}
