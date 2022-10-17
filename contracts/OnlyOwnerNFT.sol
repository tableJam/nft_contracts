// SPDX-License-Identifier: MIT

pragma solidity  ^0.8.14;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NFT is ERC721{
    address public owner;
    constructor() ERC721("OG_NFT","MNFT"){
        owner = _msgSender();
    }
    /**
    *@dev
    *- people be able to mint is only peolpe who deploy this contract; 
    */
    function  Only_Ownwe_nft_mint(uint256 tokenId) public onlyOwner {
       _mint(_msgSender(),tokenId);
    }
    /**
    * @dev
    *- modifier for function of Only_Ownwe_nft_mint
    */
    modifier onlyOwner{
       address  who_send_this = _msgSender();
       require(owner == who_send_this,"🤔 you can not mint 🥴");
       _;
    }

}