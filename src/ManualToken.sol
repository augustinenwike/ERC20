// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract OurToken {
    string public name = "OurToken";
    uint256 public totalSupply = 100000000000000000000;
    uint8 public decimals = 18;
    mapping(address => uint256) public _balanceOf;

    function balanceOf(address account) public view returns (uint256) {
        return _balanceOf[account];
    }

    function transfer(address recipient, uint256 amount) public returns (bool) {
        uint256 senderBalance = _balanceOf[msg.sender];
        require(senderBalance >= amount, "ERC20: transfer amount exceeds balance");
        _balanceOf[msg.sender] = senderBalance - amount;
        _balanceOf[recipient] += amount;

        return true;
    }
}
