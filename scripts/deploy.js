async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying with:", deployer.address);

  const Contract = await ethers.getContractFactory("SchoolManagement");
  const contract = await Contract.deploy();
  await contract.deployed();

  console.log("Contract deployed at:", contract.address);
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
