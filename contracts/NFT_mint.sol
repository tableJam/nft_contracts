// SPDX-License-Identifier: MIT

pragma solidity  ^0.8.7;

import "@openzeppelin/contracts@4.6.0/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.6.0/access/Ownable.sol";
import "@openzeppelin/contracts@4.6.0/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts@4.6.0/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts@4.6.0/token/ERC721/extensions/ERC721Pausable.sol";
import "@openzeppelin/contracts@4.6.0/utils/Counters.sol";
import "@openzeppelin/contracts@4.6.0/utils/Strings.sol";


contract NFT is ERC721Pausable,ERC721Burnable,ERC721URIStorage,Ownable{

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;


    event TokenUriEvent(address indexed sender,uint256 indexed tokenId , string uri);
    event BurnNFT(address indexed sender, uint256 indexed tokeId, string tokenUri);

    constructor() ERC721("NFT","NFT"){
    }

    /**
    *@dev
    *- people be able to mint is only peolpe who deploy this contract; 
    */
    function  nft_mint() public onlyOwner whenNotPaused{
        _tokenIds.increment();
        uint256 tokenId = _tokenIds.current();

        string memory jsonFile = string(abi.encodePacked('metadata',Strings.toString(tokenId),'.json'));

        _setTokenURI(tokenId,jsonFile);
       _mint(_msgSender(),tokenId);
       emit TokenUriEvent(_msgSender(),tokenId,jsonFile);
    }

    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://bafkreie4iiue7r4alvfqww6r2dsds6jo2ttgu3thfwu3jov3oi35cyqhba/";
    }

    function pause() public onlyOwner{
        _pause();
    }
    function unpaused() public onlyOwner{
        _unpause();
    }

    function tokenURI(uint256 tokeId) public view override(ERC721,ERC721URIStorage) returns(string memory){
        return super.tokenURI(tokeId);
    }

    function _burn(uint256 tokenId) internal override(ERC721,ERC721URIStorage){
        super._burn(tokenId);
        string memory tokenUri = tokenURI(tokenId);
        emit BurnNFT(_msgSender(),tokenId,tokenUri);
    }

    function _beforeTokenTransfer(address from,address to,uint256 tokeId) internal override(ERC721,ERC721Pausable){
        return super._beforeTokenTransfer(from,to,tokeId);
    }

    

}