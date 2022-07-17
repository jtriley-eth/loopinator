// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

function map(uint256[] memory numbers, function(uint256) pure returns (uint256) func) pure returns (uint256[] memory) {
    uint256 length = numbers.length;
    uint256[] memory newNumbers = new uint256[](length);

    for (uint256 i; i < length; ) {
        newNumbers[i] = func(numbers[i]);
        unchecked { ++i; }
    }

    return newNumbers;
}

function forEach(uint256[] memory numbers, function(uint256) pure func) pure {
    uint256 length = numbers.length;

    for (uint256 i; i < length; ) {
        func(numbers[i]);
        unchecked { ++i; }
    }
}

function reduce(
    uint256[] memory numbers,
    function(uint256, uint256) pure returns (uint256) func,
    uint256 initialValue
) pure returns (uint256) {
    uint256 result = initialValue;
    uint256 length = numbers.length;

    for (uint256 i; i < length; ) {
        result = func(result, numbers[i]);
        unchecked { ++i; }
    }

    return result;
}
