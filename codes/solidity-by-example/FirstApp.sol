// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Counter{
    uint256  public count;

    // get count
    function get() public view returns (uint256){
        return count;
    }

    // count = count + 1
    function inc() public {
        count += 1;
    }

    // count = count - 1
    function dec() public {
        if(count > 0){
            count -= 1;
        }
    }
}