// SPDX-License-Identifier: MIT

pragma solidity  ^0.8.7;

import "@openzeppelin/contracts@4.6.0/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.6.0/access/Ownable.sol";
import "@openzeppelin/contracts@4.6.0/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts@4.6.0/utils/Counters.sol";

contract eventNFT is ERC721URIStorage,Ownable{

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;


    event TokenUriEvent(address indexed sender,uint256 indexed tokenId , string uri);


    constructor() ERC721("eventNFT","eventNFT"){
    }

    /**
    *@dev
    *- people be able to mint is only peolpe who deploy this contract; 
    */
    function  Only_Owner_nft_mint(string calldata uri) public onlyOwner {
        _tokenIds.increment();
        uint256 tokenId = _tokenIds.current();
        _setTokenURI(tokenId,uri);
       _mint(_msgSender(),tokenId);
       emit TokenUriEvent(_msgSender(),tokenId,uri);
    }


}