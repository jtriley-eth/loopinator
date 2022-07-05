// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.14;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/Loopinator.sol";
import "./benchmarks/LoopinatorBenchmark.sol";
import "./benchmarks/StdBenchmark.sol";

// -----------------------------------------------------------------------------
// Must add this line to use array.func syntax
using { map, forEach, reduce } for uint256[];

contract Benchmark is Test {
    LoopinatorBenchmark internal loopinator;
    StdBenchmark internal std;

    function setUp() public {
        loopinator = new LoopinatorBenchmark();
        std = new StdBenchmark();
    }

    function testMap() public view {
        uint256[] memory numbers = _arrayify(100);

        uint256 stdGas = gasleft();
        std.doubleAll(numbers);
        stdGas -= gasleft();

        uint256 mapGas = gasleft();
        loopinator.doubleAll(numbers);
        mapGas -= gasleft();

        console.log("Std gas used       ", stdGas);
        console.log("Map gas used       ", mapGas);
    }

    function testForEach() public view {
        uint256[] memory numbers = _arrayify(100);

        uint256 stdGas = gasleft();
        std.noneAreZero(numbers);
        stdGas -= gasleft();

        uint256 forEachGas = gasleft();
        loopinator.noneAreZero(numbers);
        forEachGas -= gasleft();

        console.log("Std gas used       ", stdGas);
        console.log("ForEach gas used   ", forEachGas);
    }

    function testReduce() public view {
        uint256[] memory numbers = _arrayify(100);

        uint256 stdGas = gasleft();
        std.sumAll(numbers);
        stdGas -= gasleft();

        uint256 reduceGas = gasleft();
        loopinator.sumAll(numbers);
        reduceGas -= gasleft();

        console.log("Std gas used       ", stdGas);
        console.log("Reduce gas used    ", reduceGas);
    }

    function _arrayify(uint256 length) internal pure returns (uint256[] memory) {
        uint256[] memory numbers = new uint256[](length);

        for (uint256 i; i < length; ++i) {
            numbers[i] = i + 1;
        }

        return numbers;
    }
}
