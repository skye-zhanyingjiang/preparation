// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract SimpleStorage {
    uint256 public num;

    // set 调用时需要输入 , 约定 下划线开头,小写
    function set(uint256 _num) public {
        num = _num;
    }
    
    // setNum 变量前缀
    function get() public view returns (uint256 setNum) {
        return num;
    }
}