// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract FunctionModifier{

     // We will use these variables to demonstrate how to use
    // modifiers.
    address public owner;
    uint256 public x = 10;
    bool public locked;
    
    // 合约部署时执行一次 , 调用合约地址赋值给owner
    constructor() {
        // Set the transaction sender as the owner of the contract.
        owner = msg.sender;
    }

    // Modifier to check that the caller is the owner of
    // the contract.
    // modifier
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        // Underscore is a special character only used inside
        // a function modifier and it tells Solidity to
        // execute the rest of the code.
        _; // 代表函数主体
    }

    // Modifiers can take inputs. This modifier checks that the
    // address passed in is not the zero address.
    modifier validAddress(address _addr) {
        // address(0) = 0x000... 
        require(_addr != address(0), "Not valid address");
        _;
    }

    // 调用者必须是部署合约地址 , 校验地址是否有效
    function changeOwner(address _newOwner)
        public
        onlyOwner
        validAddress(_newOwner)
    {
        owner = _newOwner;
    }

    // Modifiers can be called before and / or after a function.
    // This modifier prevents a function from being called while
    // it is still executing.

    // 避免重入攻击 , 避免一个函数未执行完被重新调用
    modifier noReentrancy() {
        require(!locked, "No reentrancy");

        locked = true;
        _;
        locked = false;
    }

    function decrement(uint256 i) public noReentrancy {
        x -= i;

        if (i > 1) {
            decrement(i - 1);
        }
    }


    // 死循环 
    function decrement2(uint256 i) public  {
        require(!locked, "No reentrancy");
        locked = true;

        x -= i;

        if (i > 1) {
            // 执行这里时  死循环 ,函数不结束 ,locked 一直都等于 true
            decrement(i - 1);
        }

        locked = false;
    }

}