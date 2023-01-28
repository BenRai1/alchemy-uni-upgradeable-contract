// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract VendingMachineV3 is Initializable {

    //Proxy contract address: 0x8a1FdAd5f07385c218e4bb3d54D652B4aa9d3D3e
    //Implementation contract address: 0x6427C35d2D0dc25dc9861A2796566B179F5A3C06
    // these state variables and their values
    // will be preserved forever, regardless of upgrading
    uint public numSodas;
    address public owner;
    mapping(address => uint) purchasingHistory;

    function initialize(uint _numSodas) public initializer {
    numSodas = _numSodas;
    owner = msg.sender;
    }

    function purchaseSoda() public payable {
    require(msg.value >= 1000 wei, "You must pay 1000 wei for a soda!");
    numSodas--;
    purchasingHistory[msg.sender] += 1;
    }

    function restockSoda(uint newSodas) external onlyOwner{
        numSodas += newSodas;
    }
    function withdraw() external onlyOwner {
        require(address(this).balance >0, "No eth to withdraw");
        (bool success, ) = owner.call{value: address(this).balance}("");
        require(success, "Failed to sent Eth");
    }


    function updateOwner(address newOwner) external onlyOwner{
        owner = newOwner;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "You are not the owner");
        _;
    }


}