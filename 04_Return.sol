// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;


contract Return{

    // 数组类型返回值默认必须用memory修饰
    function returnMultiple() public pure returns(uint256, bool, uint256[3] memory){
        return (1, true, [uint256(1),3,7]);
    }

    //returns 表明参数名称，会自动返回变量的值
    function returnName1() public pure returns(uint256 _number, bool _bool, uint256[3] memory _array){
        _number = 1;
        _bool = false;
        _array = [uint256(1), 3, 7];
    }

    function returnName2() public pure returns(uint256 _number, bool _bool, uint256[3] memory _array){
        return (1, false, [uint256(1), 4, 11]);
    }

    function readReturn() public pure{
        uint256 _number;
        bool _bool;
        bool _bool2;
        uint256[3] memory _array;
        (_number, _bool, _array) = returnName1();
        (, _bool2, ) = returnName1();
    }

}