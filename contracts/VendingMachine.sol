// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract VendingMachineV1 is Initializable {

//Proxy contract address: 0x8a1FdAd5f07385c218e4bb3d54D652B4aa9d3D3e
    
//Implementation contract address: 0x9e32C18afdC9F49e2C5CfDf21173c084C2779024

  // these state variables and their values
  // will be preserved forever, regardless of upgrading
  uint public numSodas;
  address public owner;

  function initialize(uint _numSodas) public initializer {
    numSodas = _numSodas;
    owner = msg.sender;
  }

  function purchaseSoda() public payable {
    require(msg.value >= 1000 wei, "You must pay 1000 wei for a soda!");
    numSodas--;
  }
}