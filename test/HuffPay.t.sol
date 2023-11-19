// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

contract HuffPayTest is Test {
    IHuffPay public huffPay;
    address public zero = address(0);
    address public constant dai = 0x6B175474E89094C44Da98b954EedeAC495271d0F;

    function setUp() public {
        huffPay = IHuffPay(
            HuffDeployer
            .config()
            .with_args(bytes.concat(abi.encode(dai), abi.encode(100)))
            .deploy("HuffPay")
        );
    }

    function testSetupStream() public {
        address bob = makeAddr("bob");
        address nonso = makeAddr("nonso");
        uint256 monthlySalary = 900e18;
        uint256 secInMonth = 24 * 3600 * 30 seconds;

        deal(dai, nonso, 1000e18);

        vm.startPrank(nonso);
        IERC20(dai).approve(address(huffPay), type(uint).max);
        uint256 amountPerSec = (monthlySalary * 100) / secInMonth;
        huffPay.createStream(bob, uint216(amountPerSec));
        huffPay.deposit(monthlySalary); 
        skip(secInMonth/2);
        vm.stopPrank();

        huffPay.withdraw(nonso, bob, uint216(amountPerSec));
        skip(secInMonth/4);
        vm.startPrank(nonso);
        // huffPay.cancelStream(bob, uint216(amountPerSec));
        huffPay.withdrawPayerAll();
        vm.stopPrank();
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
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}

interface Constructor {
  function getArgOne() external returns (address);
  function getArgTwo() external returns (uint256);
}