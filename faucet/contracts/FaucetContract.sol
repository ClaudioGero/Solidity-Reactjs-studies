// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import "./OwnedContract.sol";
import "./LoggerContract.sol";
import "./IFaucetContract.sol";

contract Faucet is Owned,Logger, IFaucet{
  uint public numFunders;
  mapping(address=>bool) public funders;
  mapping(uint=>address) public lutfunders;
  modifier limitWithdraw(uint amount){
    require (amount <= 100000000000000000,"cannot withdraw more than 0.1eth");
    _;
  }


  receive() external payable{}
  function emitLog() public override pure returns (bytes32){
    return "Helloworld";
  }

  function teste1() external onlyOwner{
    //so para adinistradores
  }
  function teste2() external onlyOwner{
    //so para adinistradores
  }
  function transferOwnership(address newOwner) external onlyOwner{
    owner=newOwner;
  }
  function addFunds() override external payable {
    address funder = msg.sender;
    teste3();
    if (!funders[funder]){
      funders[funder]==true;
      lutfunders[numFunders] = funder;
      numFunders++;

    }
  }
  function getFunders() external view returns(address[] memory){
    address[] memory _funders = new address[](numFunders);
    for (uint i =0; i<numFunders;i++){
      _funders[i]= lutfunders[i];

    }
    return _funders;

  }

  function getFunderIndex(uint8 index) external view returns (address){

    return lutfunders[index];
  }
  function withdraw(uint value) override external limitWithdraw(value){
    payable(msg.sender).transfer(value);
 
  }
}
//const instance = await Faucet.deployed()
//instance.addFunds({from: accounts[1], value: "2000000000000000000"})