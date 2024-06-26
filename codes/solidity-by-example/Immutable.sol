// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Immutable {
    // immutable 和 constant 很像 , 名字不需要全大写
    address public immutable addr;
    uint256 public immutable num;

    // 合约部署时 constructor 初始化函数 , 初始化后不可被篡改
    constructor(uint256 _myUint) {
        addr = msg.sender;
        num = _myUint;
    }

    // TypeError: Cannot write to immutable here: Immutable variables can only be initialized inline or assigned directly in the constructor.
    // function mod() public {
    //     num = 456;
    // }
}