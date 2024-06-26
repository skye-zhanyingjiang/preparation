// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;


// Parent contract
contract ParentContract {
    uint256 internal parentValue;

    function getParentValue() public view returns (uint256) {
        return parentValue;
    }

    function setParentValue(uint256 newValue) internal {
        parentValue = newValue;
    }
}

// Child contract inheriting from ParentContract
contract ChildContract is ParentContract {
    uint256 private childValue;

    function getChildValue() public view returns (uint256) {
        return childValue;
    }

    function setChildValue(uint256 newValue) public {
        childValue = newValue;
    }
}

// Interface
interface ITest {
    function getValue() external view returns (uint256);
    function setValue(uint256 newValue) external;
}

// Contract implementing the interface
contract TestContract is ITest {
    uint256 private value;

    function getValue() public view override returns (uint256) {
        return value;
    }

    function setValue(uint256 newValue) public override {
        value = newValue;
    }
}

interface ITest2 {
    function val() external view returns (uint256);
    function test() external;
}


contract Callback {
    uint256 public val;

    fallback() external {
        val = ITest2(msg.sender).val();
    }

    function test(address target) external {
        ITest2(target).test();
    }
}

contract TestStorage {
    uint256 public val;

    function test() public {
        val = 123;
        bytes memory b = "";
        msg.sender.call(b);
    }
}

contract TestTransientStorage {
    bytes32 constant SLOT = 0;

    function test() public {
        // assembly 插入内联汇编语言代码
        // 优点 , 
        // 性能优化,直接与EVM交互,减少编译器开销
        // 灵活性 , 本身不支持低级操作,提供更多控制和灵活性
        // 缺点
        // 复杂性,内联会变代码难以理解维护 ,增加代码复杂性
        // 安全性, 手动操作存储和其他低级语言容易出错, 引入安全漏洞
        // 可读性,内联汇编代码比Solidity戴拿难读,不利于代码审计和合作开发
        // 常用于
        // 优化Gas成本,在Gas费用较高的操作中,使用内联汇编可以减少不必要的开销
        // 自定义逻辑,使用Solidity中无法直接表达的逻辑或操作
        // 高级合约功能,如处理复杂的数学运算,直接访问内存,与其他合约低级交互等
        assembly {
            // 将321  , 插入槽位SLOT
            tstore(SLOT, 321)
        }
        bytes memory b = "";
        msg.sender.call(b);
    }

    function val() public view returns (uint256 v) {
        assembly {
            // 从SLOT 槽位加载值
            v := tload(SLOT)
        }
    }
}

contract ReentrancyGuard {
    bool private locked;

    // modifier 定义了一个修饰符
    // require 条件检查函数
    modifier lock() {
        require(!locked);
        locked = true;
        _;
        locked = false;
    }

    // 35313 gas
    function test() public lock {
        // Ignore call error
        bytes memory b = "";
        msg.sender.call(b);
    }
}

contract ReentrancyGuardTransient {
    // 声明一个常量存储槽位置的语法
    // constant常量,合约部署后就不会改变
    bytes32 constant SLOT = 0;

    modifier lock() {
        assembly {
            if tload(SLOT) { revert(0, 0) }
            tstore(SLOT, 1)
        }
        _;
        assembly {
            tstore(SLOT, 0)
        }
    }

    // 21887 gas
    function test() external lock {
        // Ignore call error
        bytes memory b = "";
        msg.sender.call(b);
    }
}