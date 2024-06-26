// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract ArrayRemoveByShifting{

    // [1, 2, 3] -- remove(1) --> [1, 3, 3] --> [1, 3]
    // [1, 2, 3, 4, 5, 6] -- remove(2) --> [1, 2, 4, 5, 6, 6] --> [1, 2, 4, 5, 6]
    // [1, 2, 3, 4, 5, 6] -- remove(0) --> [2, 3, 4, 5, 6, 6] --> [2, 3, 4, 5, 6]
    // [1] -- remove(0) --> [1] --> []

    uint[] public arr = [1,2,3,4,5];

    // memory 数据位置修饰符
    // memory 数据临时存储在内存中 , 成本比storage便宜,函数内部操作复杂数据结构通常使用
    // storage 数据持久存储在区块链上, 生命周期和合约相同,默认存储在storage
    // calldata 数据存储在调用的数据中 , 只读 ,不可修改 , 只要勇于外部函数的参数 , 适合大数据传递,节省Gas

    function getArr() public view returns(uint[] memory){
        return  arr;
    }

    // 弹出指定索引位置的数据 , 删除
    function remove(uint256 _index) public {
        // require 验证输入参数 , 检查合约状态变量,确保调用者具有足够的权限,检查某些外部条件是否成立
        // require(condition, "Error message");
        // require：用于验证外部输入或合约状态，失败时抛出错误并回退交易，退还剩余的Gas。
        // assert：用于检查内部错误，确保合约逻辑正确。assert 失败表示存在严重错误，消耗所有剩余的Gas。
        // revert：显式抛出错误并回退交易，通常与条件检查结合使用。
        require(_index < arr.length, "index out of bound");

        for (uint256 i = _index; i < arr.length - 1; i++) {
            arr[i] = arr[i + 1];
        }
        arr.pop();
    }

    function test() external {
        arr = [1, 2, 3, 4, 5];
        remove(2);
        // [1, 2, 4, 5]
        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr[3] == 5);
        assert(arr.length == 4);

        arr = [1];
        remove(0);
        // []
        assert(arr.length == 0);
    }
}