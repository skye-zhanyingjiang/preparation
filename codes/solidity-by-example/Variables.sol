// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Variables{

    // local 存在内存中,调用的时候才有
    // function doSomething() public view returns(uint,address){

    //     uint time = block.timestamp;

    //     // Warning: Unused local variable.
    //     // address send = msg.sender;

    //     return (time,send);
    // }


    // global 默认的全局变量 , 整个以太坊自带的变量
    // 返回当前区块的时间戳, 秒级别的Unix时间戳
    uint256 public timestamp = block.timestamp;

    // blockchain 存在链上,消耗gas
    string public text = "Hello World !"; // 

    // 返回的是当前调用合约的发送方（即发起当前交易或调用的地址）
    address public sender = msg.sender;

    // 内置函数 type
    // -2147483648
    int32 public int32Min = type(int32).min;

    // 2147483647
    int32 public int32Max = type(int32).max;


    address public owner;

    constructor() {
        // 在合约部署时，将合约创建者的地址设为owner
        owner = msg.sender;
    }

    // 仅允许合约所有者调用的函数
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    // 只有合约所有者可以调用此函数
    function restrictedFunction() public onlyOwner {
        // 执行某些受限制的操作
    }

    // 记录发送方地址的函数
    function logSender() public view returns (address) {
        return msg.sender;
    }

}