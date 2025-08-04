const hre = require("hardhat");

async function main() {
    const [deployer]= await hre.ethers.getSigners();

    const TokenA = await hre.ethers.getContractFactory("TokenA");
    const tokenA = await TokenA.deploy();
    await tokenA.deployed();

    const TokenB = await hre.ethers.getContractFactory("TokenB");
    const tokenB = await TokenB.deploy();
    await tokenB.deployed();

    const DEX = await hre.ethers.getContractFactory("SimpleDEX");
    const dex = await DEX.deploy(tokenA.address,tokenB.address);
    await dex.deployed();

    console.log("TokenA deployed to:", tokenA.address);
    console.log("TokenB deployed to:", tokenB.address);
    console.log("SimpleDEX deployed to:", dex.address);
}

main().catch((error) => {
    console.error(error);
    process.exitCode=1;
});