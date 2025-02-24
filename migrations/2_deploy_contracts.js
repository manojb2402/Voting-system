const Voting = artifacts.require("Voting");

module.exports = async function (deployer) {
  try {
    await deployer.deploy(Voting);
    console.log("Voting contract deployed successfully!");
  } catch (err) {
    console.error("Error deploying Voting contract:", err);
  }
};
