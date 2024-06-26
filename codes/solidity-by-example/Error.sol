// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract ErrorDemo {

    function testRequire(uint256 _i) public pure {
        // Require should be used to validate conditions such as:
        // - inputs 输入
        // - conditions before execution 执行前的条件是否满足
        // - return values from calls to other functions  洽谈函数返回值是否满足
        // 条件验证,条件不满足,中止执行并回滚素有状态更改,
        // require(condition, "Error message");
        require(_i > 10, "Input must be greater than 10");
    }

    function testRevert(uint256 _i) public pure {
        // Revert is useful when the condition to check is complex.
        // This code does the exact same thing as the example above
        if (_i <= 10) {
            // 合约中主动中止执行并回滚所有状态更改
            // revert("Error message");
            revert("Input must be greater than 10");
        }
    }

    uint256 public num;

    function testAssert() public view {
        // Assert should only be used to test for internal errors,
        // and to check invariants.

        // Here we assert that num is always equal to 0
        // since it is impossible to update the value of num

        // Assert 这个关键词只能用于测试内部错误和不变量
        assert(num == 1);
    }

    // custom error
    error InsufficientBalance(uint256 balance, uint256 withdrawAmount);

    function testCustomError(uint256 _withdrawAmount) public view {
        // bal=0 , 表示当前合约没有收到任何以太币
        uint256 bal = address(this).balance;
        
        if (bal < _withdrawAmount) {
            revert InsufficientBalance({
                balance: bal,
                withdrawAmount: _withdrawAmount
            });
        }
    }
}