// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.14;

import "../../src/Loopinator.sol";

using { map, forEach, reduce } for uint256[];

contract LoopinatorBenchmark {

    function doubleAll(uint256[] memory numbers) public pure returns (uint256[] memory) {
        return numbers.map(double);
    }

    function noneAreZero(uint256[] memory numbers) public pure {
        numbers.forEach(notZero);
    }

    function sumAll(uint256[] memory numbers) public pure returns (uint256) {
        return numbers.reduce(sum, 0);
    }
}

function double(uint256 a) pure returns (uint256) {
    return a * 2;
}

error CannotBeZero();

function notZero(uint256 a) pure {
    if (a == 0) revert CannotBeZero();
}

function sum(uint256 lastValue, uint256 element) pure returns (uint256) {
    return lastValue + element;
}
