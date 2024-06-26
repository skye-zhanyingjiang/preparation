// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Account {
    uint256 public balance;
    uint256 public constant MAX_UINT = 2 ** 256 - 1;

    function deposit(uint256 _amount) public {
        // 记录旧值
        uint256 oldBalance = balance;
        // 记录新值
        uint256 newBalance = balance + _amount;

        // newBalance >= oldBalance 不成立时报错Overflow
        require(newBalance >= oldBalance, "Overflow");

        // 新值赋值给balance
        balance = newBalance;

        // 新值必须大于等于旧值
        assert(balance >= oldBalance);
    }

    function withdraw(uint256 _amount) public {
        // 记录旧值
        uint256 oldBalance = balance;

        // 必须余额大于等于输入参数 , 否则报错Underflow
        require(balance >= _amount, "Underflow");

        // 余额balance 小于 输入_amount 报错
        if (balance < _amount) {
            revert("Underflow");
        }

        // 余额扣减
        balance -= _amount;

        // 扣减余额必须小于等于原始余额
        assert(balance <= oldBalance);
    }
}
