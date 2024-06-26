// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Primitives{

    // bool deful false 
    bool public defBoo;

    bool public trueBoo = true;

    bool public falseBoo = false;

    // 非负整数类型,2**8-1 256
    uint8 public numUint8 = 0;

    uint8 public numUint8Max = 2**8-1;

    uint16 public numUint16 = 0;

    // 65535
    uint16 public numUint16Max = 2**16-1;

    uint public numUint = 0;

    uint public numUintMax = 2**256-1;

    int8 public numInt8Max = 127;

    int8 public numInt8Min = -128;

    int256 public minInt = type(int256).min;

    int256 public maxInt = type(int256).max;

    // def : 0x0000000000000000000000000000000000000000
    address  public addr;

    // 0x00
    // bytes1  16进制 1字节
    bytes1 public  byt1 = 0xb5;

    // 0x0000  2字节
    bytes2 public  byt2 ;

}