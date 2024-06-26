// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Array{
    // Several ways to initialize an array
    uint256[] public arr;
    uint256[] public arr2 = [1, 2, 3];
    // Fixed sized array, all elements initialize to 0
    uint256[10] public myFixedSizeArr;

    function get(uint256 i) public view returns (uint256) {
        return arr[i];
    }

    // Solidity can return the entire array.
    // But this function should be avoided for
    // arrays that can grow indefinitely in length.
    function getArr() public view returns (uint256[] memory) {
        return arr;
    }

    // 压栈
    function push(uint256 i) public {
        // Append to array
        // This will increase the array length by 1.
        arr.push(i);
    }

    // 先进先出
    function pop() public {
        // Remove last element from array
        // This will decrease the array length by 1
        arr.pop();
    }
    
    // 默认长度0 , 
    function getLength() public view returns (uint256) {
        return arr.length;
    }

    function remove(uint256 index) public {
        // Delete does not change the array length.
        // It resets the value at index to it's default value,
        // in this case 0
        delete arr[index];
    }

    // external 外部调用 , 比public更便宜的调用, 可以通过this关键字从合约内部调用内部分发
    function examples() external pure {
        // create array in memory, only fixed size can be created
        // uint256[] memory a = new uint256[](5); // 创建一个固定长度的数组
    }

    // external 函数，只能通过合约外部调用
    function externalFunction(uint256 a) external pure returns (uint256) {
        return a * 2;
    }

    // public 函数，可以从外部和内部调用
    function publicFunction(uint256 a) public pure returns (uint256) {
        return a * 3;
    }

    // internal 函数，只能从合约内部和继承的合约调用
    function internalFunction(uint256 a) internal pure returns (uint256) {
        return a * 4;
    }

    // private 函数，只能从当前合约内部调用
    function privateFunction(uint256 a) private pure returns (uint256) {
        return a * 5;
    }

    // 调用 external 函数，必须使用 `this`
    function callExternalFunction(uint256 a) public view returns (uint256) {
        return this.externalFunction(a);
    }


}