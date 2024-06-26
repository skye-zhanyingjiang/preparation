// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;


contract Event {
// Event declaration
    // Up to 3 parameters can be indexed.
    // Indexed parameters helps you filter the logs by the indexed parameter
    //  address 或 bytes32 类型的参数，可以使用 indexed 关键字进行标记。
    // 在事件日志中，索引化的参数会被存储在特殊的数据结构中，使得客户端可以快速访问和过滤这些参数的值。
    event Log(address indexed sender, string message);
    event AnotherLog();

    function test() public {
        // emit 发送日志 ,  msg.sender 调用方地址
        emit Log(msg.sender, "Hello World!");
        emit Log(msg.sender, "Hello EVM!");
        emit AnotherLog();
    }
}