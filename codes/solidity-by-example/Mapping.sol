// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Mapping{

    // mapping 输入mapping (keyvalue关键值 => valueType某个值类型) 一一匹配起来
    // keyvalue string bool int address bytes 或者某个已经部署的合约
    // valueType 可以是多种类型边浪, 甚至是另一个mapping , 或者是一个array 动态数组

    mapping(address => uint)  myMap; // 定义了一个方法 , 将一个地址和一个数字匹配起来

    function getByAdd(address _add) public view  returns(uint){
        // 返回对应的数据 , 没有返回默认值 0
        return myMap[_add];
    }

    function setByAdd(address _add, uint _i) public {
        // 更新每个地址对应的数
        myMap[_add] = _i;
    }

    function removeAdd(address _add) public {
        // 把_add对应的数恢复成初始值 0
        delete myMap[_add];
    }
}

