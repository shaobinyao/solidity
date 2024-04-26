// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;


    //函数
    //function <function name>(<parameter types>) {internal|external|public|private} [pure|view|payable] [returns (<return types>)]
    // {internal|external|public|private} 表示函数可见性说明符
    // 1.internal：只能从合约内部访问，继承的合约也可用
    // 2.external：只能从合约外部访问，但内部也可以通过 this. 访问
    // 3.public：内部和外部都可访问
    // 4.private：只能本合约可见，继承的合约也不可见
    // TIP：需要明确指定可见性，没有默认值；

    //[pure|view|payable]
    // 决定函数权限/功能的关键字。
    // payable：可支付的，带着它的函数，运行的时候可以给合约转入ETH
    // pure：“纯”，pure函数既不能读取也不能写入链上的状态变量
    // view：“看”，view函数能读取但也不能写入状态变量

    // 合约的状态变量存储在链上，gas fee 很贵，如果计算不改变链上状态，就可以不用付 gas。
    // 包含 pure 和 view 关键字的函数是不改写链上状态的，因此用户直接调用它们是不需要付 gas 
    // 在以太坊中，以下语句被视为修改链上状态：
    // 1.写入状态变量。
    // 2.释放事件。
    // 3.创建其他合约。
    // 4.使用 selfdestruct.
    // 5.通过调用发送以太币。
    // 6.调用任何未标记 view 或 pure 的函数。
    // 7.使用低级调用（low-level calls）。
    // 8.使用包含某些操作码的内联汇编。


    //[returns ()]：
    // 函数返回的变量类型和名称

contract FunctionTypes{
    uint256 public number = 5;

    // 如果函数加 pure 会报错，因为pure没有权限改变合约的状态变量，既不能读，更不能写。
    // 如果函数加 view 也会报错，因为view只能读取合约的状态变量，这个函数里number变量加1，改变状态了。
    function add() external{ 
        number = number + 1;
    }

    function addPure(uint256 _number) external pure returns(uint256 _newnumber){
        _newnumber = _number + 1; //参数传入新的值，值做加法，返回新的变量，没有读取或写入合约的状态变量，可以加pure。
    }

    function addView() external view returns(uint256 _newnumber){
        _newnumber = number + 1; //这里只读取number的值，没变改变number变量的值，新的值赋值给了_newnumber变量。
    }

    // internal 内部函数，只能在合约内访问
    function minus() internal {
        number = number - 1;
    }
    //定义一个外部访问函数，间接调用minus函数
    function minusCall() external{
        minus();
    }

    // payable函数：转账，能给合约转ETH的函数
    function minusPayable() external payable returns(uint256 balance){
        minus();
        balance = address(this).balance; //this引用合约地址
    }


}