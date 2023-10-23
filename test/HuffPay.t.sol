// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

contract HuffPayTest is Test {
    IHuffPay huffPay;
    address public zero = address(0);
    address public constant dai = 0x6B175474E89094C44Da98b954EedeAC495271d0F;

    function setup() public {
        huffPay = IHuffPay(HuffDeployer.deploy_with_args("HufPay", abi.encode(dai)));
    }
}

interface IHuffPay {
    function createStream(address to, uint216 amountPerSec) external ;
    function createStreamWithReason(address to, uint216 amountPerSec, string calldata reason) external ;
    function withdraw(address from, address to, uint216 amountPerSec) external ;
    function cancelStream(address to, uint216 amountPerSec) external ;
    function pauseStream(address to, uint216 amountPerSec) external ;
    function modifyStream(address oldTo, uint216 oldAmountPerSec, address to, uint216 amountPerSec) external ;
    function deposit(uint amount) external ;
    function withdrawPayer(uint amount) external ;
    function withdrawPayerAll() external ;
}

interface IERC20 {

}