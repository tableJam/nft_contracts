// SPDX-License-Identifier: MIT

pragma solidity  ^0.8.14;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NFT is ERC721{
    address public owner;
    constructor() ERC721("NFT","MNFT"){
        owner = _msgSender();
    }
    
    function  Only_Ownwe_nft_mint(uint256 tokenId) public {
       address  who_send_this = _msgSender();
       require(owner == who_send_this,"you can not mint");
       _mint(who_send_this,tokenId);
    }

    
}