// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.14;

import "../../src/Loopinator.sol";

using { map, forEach, reduce } for uint256[];

contract StdBenchmark {

    function doubleAll(uint256[] memory numbers) public pure returns (uint256[] memory) {
        uint256 length = numbers.length;
        uint256 i;
        uint256[] memory newNumbers = new uint256[](length);

        for (i; i < length; ) {
            newNumbers[i] = numbers[i] * 2;

            unchecked { ++i; }
        }

        return newNumbers;
    }

    error CannotBeZero();

    function noneAreZero(uint256[] memory numbers) public pure {
        uint256 length = numbers.length;
        uint256 i;

        for (i; i < length; ) {
            if (numbers[i] == 0) revert CannotBeZero();

            unchecked { ++i; }
        }
    }

    function sumAll(uint256[] memory numbers) public pure returns (uint256) {
        uint256 length = numbers.length;
        uint256 i;
        uint256 result;

        for (i; i < length; ) {
            result += numbers[i];

            unchecked { ++i; }
        }

        return result;
    }
}
