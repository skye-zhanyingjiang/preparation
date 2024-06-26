// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract IfElse{

    // view 不会修改合约状态 , 可以访问合约的状态变量 , 并且可以调用其他 view 或pure 函数
    // pure 不读取也不修改合约装的状态,pure 只能处理传入参数 ,不能访问或修改合约的状态变量,不能调用任何可以改变状态的函数
    function foo(uint x ) public pure returns(uint){
        if (x < 10) {
            return 0;
        } else if (x < 20) {
            return 1;
        } else {
            return 2;
        }
    }

    // 三元表达式
    function ternary(uint256 _x) public pure returns (uint256) {
        return _x < 10 ? 1 : 2;
    }



}