// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Function {

    uint public num=3;

    // 使用pure时候不需要读取区块链上的任何边浪
    function returnMany() pure public returns(uint , bool, uint){
        return(1,true,2);
    }


    // 使用view时候需要读取区块链上的任何边浪
    function returnMany2() view public returns(uint , bool, uint){
        return(num,true,2);
    }
    
    // 当给返回值执行名称的时候,可以使用参数=值的方式取代return;
    function returnMany3() view public returns(uint x, bool y, uint z){
        x=num;
        y=true;
        z=2;
    }

    
    function destructuringAssignments()
        public
        pure
        returns (uint256, bool, uint256, uint256, uint256)
    {
        (uint256 i, bool b, uint256 j) = returnMany(); // 直接调用函数returnMany , i=1,b=true ,j =2

        
        (uint256 x,, uint256 y) = (4, 5, 6); // x=4 , y = 6

        return (i, b, j, x, y);
    }



    // map 不能当输入参数和返回参数

    // array 可以作为输入参数
    function arrayInput(uint256[] memory _arr) public {}

    // array 可以作为返回参数
    uint256[] public arr;

    function arrayOutput() public view returns (uint256[] memory) {
        return arr;
    }
}


// Call function with key-value inputs
contract XYZ {
    function someFuncWithManyInputs(
        uint256 x,
        uint256 y,
        uint256 z,
        address a,
        bool b,
        string memory c
    ) public pure returns (uint256) {
        return x+y+z;
    }

    function callFunc() external pure returns (uint256) {
        return someFuncWithManyInputs(4, 5, 6, address(0), true, "c");
    }

    function callFuncWithKeyValue() external pure returns (uint256) {
        return someFuncWithManyInputs({
            a: address(0),
            b: true,
            c: "c",
            x: 1,
            y: 2,
            z: 3
        });
    }
}