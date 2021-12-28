// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;
 
contract Ownable {
  address public owner; 

  constructor() {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    if (msg.sender == owner)
      _;
  }

  function transferOwnership(address newOwner) public onlyOwner {
    if (newOwner != address(0)) owner = newOwner;
  }

}

contract Proxy is Ownable {
    
    address payable implementation = payable(0x6e3Be0CBc94d9295Dab7E33C202F8a1363fcb544);
  
    
    fallback() payable external {
      (bool sucess, bytes memory _result) = implementation.delegatecall(msg.data);
    }
    
    function changeImplementation(address payable _newImplementation) public onlyOwner {
           implementation = _newImplementation;
    }
    
  }
