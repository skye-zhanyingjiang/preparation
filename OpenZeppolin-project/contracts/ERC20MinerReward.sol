// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "hardhat/console.sol";

contract ERC20MinerReward is ERC20 {
    // event LogNewAlert(string description, address indexed _from, uint256 _n);

    constructor() ERC20("MinerReward", "MRW") {
        // 将100个代币分配给合约部署者
        _mint(msg.sender, 100 * 10 ** decimals());
    }

    function getBalance() public view {
        console.log("balanceOf", msg.sender, balanceOf(msg.sender)); // 输出充值后的余额
    }

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public override returns (bool) {
        _transfer(sender, recipient, amount);
        console.log("transferFrom", msg.sender, balanceOf(msg.sender)); // 输出充值后的余额
        return true;
    }
}
