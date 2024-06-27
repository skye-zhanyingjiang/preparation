# Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a Hardhat Ignition module that deploys that contract.

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat ignition deploy ./ignition/modules/Lock.js
```

# 智能合约

智能合约是区块链中存储的一种程序。 智能合约将区块链从数据扩展到代码。 它们表示各个参与方之间的协议。 它们是编码协议，当操作发生时，代码将运行并提供响应。 此类合约的所有条款和条件都以编程方式定义。 定义将为区块链的参与者指定规则、要求和奖励。 它还会指定如何在各参与方之间传输数字资产。 每个智能合约将分配有一个 20 个字节的地址，用作合约的唯一标识。 智能合约将自行运行，发送事件来触发状态转换，并调用函数。 它们非常适用于区块链技术，因为素不相识的人们可以通过它们按照指定的安全方式开展业务，而不需要任何中间商。 智能合约通常与 Ethereum 一起使用。 Ethereum 是全球首个可编程的区块链。 通过它，可以定义智能合约，来帮助传输数字资产，例如以太币。 用于编写合约的语言是 Solidity。 Solidity 是图灵完备语言，这意味着可以通过明确的定义和编码编写复杂的合同。 由于每个状态转换都会进行记录并且都不可变，因此在将合同发布到生产环境之前，应对它进行全面测试。 Bug 修复可能会产生巨大成本，甚至会严重损害系统。 智能合约的主要属性和优点如下：

- 透明：区块链用户可以读取智能合约，并可以使用 API 来访问这些合约。
- 不可变性：智能合约的执行将创建不可更改的日志。
- 分发：该合约的输出由该网络的节点验证。 合约状态可以公开显示。 在某些情况下，甚至可以看到“私有”变量。

# Hardhat

Hardhat 是一个基于 Node.js 的开发框架，专门用于以太坊智能合约的开发、部署和测试。它提供了一套强大的工具和功能，使开发者能够高效地进行智能合约的开发和管理。以下是 Hardhat 的主要特点和功能：

- 智能合约开发：Hardhat 提供了用于编写 Solidity 智能合约的开发环境，支持语法高亮、代码补全、错误检测等功能。

- 部署和任务管理：通过 Hardhat，开发者可以轻松地部署智能合约到以太坊网络或测试网络，同时可以定义和管理各种部署任务。

- 测试：Hardhat 集成了强大的测试框架，支持编写和运行自动化测试脚本，用于确保智能合约在各种情况下的正确性和安全性。

- 集成开发环境：支持与其他开发工具的集成，如 VS Code 插件、Web3.js、Truffle 等，使得开发流程更加高效和便捷。

- 插件系统：Hardhat 提供了丰富的插件系统，允许开发者根据需要扩展和定制开发环境，例如添加特定的优化、调试或者安全分析工具。

- 社区支持和更新：作为一个开源项目，Hardhat 拥有活跃的社区支持和持续的更新，保持与以太坊生态系统的最新发展和技术变化同步。

总体来说，Hardhat 是一个功能强大的开发工具，适用于从初学者到专业开发者的广泛用户群体，帮助他们更轻松地进行以太坊智能合约的开发、测试和部署。

Hardhat 还内置了 Hardhat Network，这是⼀个专为开发而设计的本地以太坊网络。它允许您部署合约、运行测试和调试代码。同时也支持将合约部署到不同的外部的evm网络上； 练习 - 安装 Solidity VS Code 扩展 Solidity VSCode 扩展：此扩展向 Visual Studio Code 添加了对 Solidity 的语言支持，并为 Hardhat 项目提供了编辑器集成，以及对 Foundry、Truffle 和 Ape 项目的实验性支持

```shell
前提 : 切换到项目目录根下执行以下命令

npm初始化: npm init

安装hardhat: npm install --save-dev hardhat

hardhat初始化: npx hardhat init

编译: npx hardhat compile

启用本地网络: npx hardhat node

部署合约到hardhat : npx hardhat ignition deploy ignition/modules/Shipping.js --network localhost

执行测试: npx hardhat test test/Shipping.js
```
