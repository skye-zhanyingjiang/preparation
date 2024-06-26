// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract EtherUnits{

    // eth最小单位 , 1 ether = 10 ** 18 wei
    uint256 public oneWei = 1 wei;

    bool public isOneWei = (oneWei == 1);

    // 计算表示Gas费用 , gwei是wei的子单位 , 1 ether = 10 ** 9 gwei , 1 gwei = 10 ** 9 wei
    uint256 public oneGwei = 1 gwei;

    bool public isOneGwei = (oneGwei == 1e9); // 10 ** 9

    // 1 eth , 一个完整的以太币, 1 ether = 10 ** 18 wei
    uint256 public oneEther = 1 ether;

    bool public isOneEther = (oneEther == 1e18); // 10 ** 18


}