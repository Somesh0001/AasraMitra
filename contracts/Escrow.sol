//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

interface IERC721 {
    function transferFrom(
        address _from,
        address _to,
        uint256 _id
    ) external;
}

contract Escrow {
   address public nftAddress; 
   address payable public seller; 
   address public inspector; 
   address public lender;  

   modifier onlyBuyer(uint256 _nftID) 
   {
    require(msg.sender == seller , "Only seller can call this method"  );
    _ ; 
   }
    modifier onlySeller() {
        require(msg.sender == seller, "Only seller can call this method");
        _;
    }

    modifier onlyInspector() {
        require(msg.sender == inspector, "Only inspector can call this method");
        _;
    }

    constructor(
        address _nftAddress,
        address payable _seller,
        address _inspector,
        address _lender
    )
    {
        nftAddress = _nftAddress;
        seller = _seller;
        inspector = _inspector;
        lender = _lender;
    }
}
