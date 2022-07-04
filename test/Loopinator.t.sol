// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.14;

import "forge-std/Test.sol";
import "../src/Loopinator.sol";

// -----------------------------------------------------------------------------
// Must add this line to use array.func syntax
using { map, forEach, reduce } for uint256[];


contract ContractTest is Test {

    // -------------------------------------------------------------------------
    // Assert array.map works
    function testMap() public {
        uint256[] memory numbers = _arrayify(1, 2, 3, 4, 5);

        numbers = numbers.map(double);

        assertEq(numbers, _arrayify(2, 4, 6, 8, 10));
    }

    // -------------------------------------------------------------------------
    // Assert array.forEach works
    function testForEach() public {
        uint256[] memory numbers = _arrayify(1, 2, 3, 4, 5);
        numbers.forEach(notZero);
        assertTrue(true);
    }

    function testFailureForEach() public {
        uint256[] memory numbers = _arrayify(1, 2, 3, 0, 5);
        numbers.forEach(notZero);
        assertTrue(true);
    }

    // -------------------------------------------------------------------------
    // Assert array.forEach works
    function testReduce() public {
        uint256[] memory numbers = _arrayify(1, 2, 3, 4, 5);
        uint256 result = numbers.reduce(sum, 0);
        assertEq(result, 15);
    }

    // -------------------------------------------------------------------------
    // Test helpers
    function _arrayify(
        uint256 a,
        uint256 b,
        uint256 c,
        uint256 d,
        uint256 e
    ) internal pure returns (uint256[] memory) {
        uint256[] memory numbers = new uint256[](5);
        numbers[0] = a;
        numbers[1] = b;
        numbers[2] = c;
        numbers[3] = d;
        numbers[4] = e;
        return numbers;
    }

    // Used with `.map`
    function double(uint256 a) internal pure returns (uint256 b) {
        return a * 2;
    }

    // Used with `.forEach`
    error CannotBeZero();
    function notZero(uint256 a) internal pure {
        if (a == 0) revert CannotBeZero(); 
    }

    // Used with `.reduce`
    function sum(uint256 lastValue, uint256 element) internal pure returns (uint256) {
        return lastValue + element;
    }
}
