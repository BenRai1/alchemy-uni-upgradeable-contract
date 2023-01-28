const { ethers, upgrades } = require("hardhat")

// TO DO: Place the address of your proxy here!
const proxyAddress = "0x8a1FdAd5f07385c218e4bb3d54D652B4aa9d3D3e"

async function main() {
    const VendingMachineV3 = await ethers.getContractFactory("VendingMachineV3")
    const upgraded = await upgrades.upgradeProxy(proxyAddress, VendingMachineV3)

    const implementationAddress = await upgrades.erc1967.getImplementationAddress(proxyAddress)

    console.log("The current contract owner is: " + (await upgraded.owner()))
    console.log("Implementation contract address: " + implementationAddress)
}

main()
