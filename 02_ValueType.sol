// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract ValueType{
    // 布尔值
    bool public _bool = true;
    // 布尔运算
    // 非
    bool public _bool1 = !_bool;
    // 与
    bool public _bool2 = _bool && _bool1;
    // 或
    bool public _bool3 = _bool || _bool2;
    // ==
    bool public _bool4 = _bool == _bool3;
    // != 
    bool public _bool5 = _bool != _bool4;

    // 整型
    int public a = -1; //证书，包含负数
    uint public b = 1; //正整数
    uint256 public c = 20240404; //256位正整数
    // + - * / %(取余) **(幂)
    uint public d = 3**2;
    uint public e = 13%3;
    bool public _numberbool = d < e;

    //地址类型
    //有2种地址类型
    //普通地址：address，存储一个20字节的值（以太坊地址的大小）
    //payable address：比普通地址多了transfer和send两个成员方法，用于接收转账
    address public _address1 = 0x4535F0f36Ce48C296Cc0935808fdE9B6443d4800;
    address payable _address2 = payable(_address1); //可以转账和查余额
    uint public _balance = _address2.balance;

    //定长字节组
    //bytes1,bytes8,bytes32，最多存储32位字节，属于值类型，定义后数组长度不可变。
    bytes32 public _bytes = "Hello World.";
    bytes1 public _byte = _bytes[0];

    

    
}