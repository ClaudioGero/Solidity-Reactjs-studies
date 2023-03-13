// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

interface IFaucet {
    //they cannot inherit from other contracts, they can only inherit from other interfaces.
    //they cannot declare a constructor or state variables. all functions have to be external.
    function addFunds() external payable;
    function withdraw(uint value) external;

}