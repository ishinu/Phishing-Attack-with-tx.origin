const { ethers } = require("hardhat");

async function main(){
    console.log("Deploying EtherBank contract...");
    const EtherBank = await ethers.getContractFactory("EtherBank");
    const etherbank = await EtherBank.deploy();
    await etherbank.deployed();
    console.log("EtherBank deployed at : ",etherbank.address);

    console.log("Deploying Attack contract...");
    const Attack = await ethers.getContractFactory("Attack");
    const attack = await Attack.deploy(etherbank.address);
    await attack.deployed();
    console.log("Attack contract deployed at : ",attack.deployed);
}

main();