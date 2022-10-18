// SPDX-License-Identifier: MIT

pragma solidity  ^0.8.7;

import "@openzeppelin/contracts@4.6.0/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.6.0/access/Ownable.sol";
import "@openzeppelin/contracts@4.6.0/token/ERC721/extensions/ERC721URIStorage.sol";


contract OffChainChangeableNFT is ERC721URIStorage,Ownable{
    constructor() ERC721("OffChainUnchangeableNFT","OCCNFT"){
    }

    /**
    *@dev
    *- people be able to mint is only peolpe who deploy this contract; 
    */
    function  Only_Owner_nft_mint(uint256 tokenId, string calldata uri) public onlyOwner {
        _setTokenURI(tokenId,uri);
       _mint(_msgSender(),tokenId);
    }


}