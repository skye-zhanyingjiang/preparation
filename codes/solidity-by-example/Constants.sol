// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Constants{
    // constant 修饰符代表这个变量是不能被改变的 , 减少很多gas消耗 
    address public constant MY_ADDRESS =
        0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
    uint256 public constant MY_UINT = 123;

    // 不需要全大写 ,但是约定俗称, 常量 全大写 , 下划线分割
    uint256 public constant my_uit = 123;

    function mod() public{
        // TypeError: Cannot assign to a constant variable.
        // MY_UINT = 456;
    }


}