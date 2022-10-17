// SPDX-License-Identifier: MIT

pragma solidity  ^0.8.14;

import "@openzeppelin/contracts@4.6.0/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.6.0/access/Ownable.sol";
import "@openzeppelin/contracts@4.6.0/token/ERC721/extensions/ERC721URIStorage.sol";



contract OffChainChangeableNFT is ERC721URIStorage,Ownable{
    constructor() ERC721("OffChainChangeableNFT","OCCNFT"){
    }
    /**
    *@dev
    *- people be able to mint is only peolpe who deploy this contract; 
    */
    function  Only_Ownwe_nft_mint(uint256 tokenId) public onlyOwner {
       _mint(_msgSender(),tokenId);
    }
    function setTokenUri(uint256 tokenId,string calldata uri) public onlyOwner{
        _setTokenURI(tokenId,uri);
    }


}