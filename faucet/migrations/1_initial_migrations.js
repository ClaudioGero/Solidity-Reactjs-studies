const MigrationsContract = artifacts.require("Migrations");
module.exports = function (deployer) {
  deployer.deploy(MigrationsContract);
};
