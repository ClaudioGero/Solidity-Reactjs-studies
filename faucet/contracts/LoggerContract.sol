// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

abstract contract Logger {
    uint public num;
    constructor(){
        num=1000;
    }
    function emitLog() public pure virtual  returns (bytes32);
    function teste3() internal pure returns(uint){
        return 100; 
    }
}