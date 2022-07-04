# Loopinator

Array looping functions for Solidity.

## Current Implementation

### `uint256[].map`

The `map` function takes a `uint256[] memory` and a function that takes a `uint256` and returns a
`uint256`.

This will loop over the array, applying the function to each element, and returning the new array.

**Usage:**

```solidity
// import
import { map } from "./Loopinator.sol";

// apply to use `array.map` syntax
using { map } for uint256[]

// define function for each iteration
function double(uint256 a) pure returns (uint256) {
    return a * 2;
}

contract MyContract {

    function doubleTheNumbers(uint256[] memory numbers) public pure returns (uint256[] memory) {

        return numbers.map(double);

    }

}
```

### `uint256[].forEach`

The `forEach` function takes a `uint256[] memory` and a function that takes a `uint256`.

This will loop over the array, executing the function on each element.

**Usage:**

```solidity
// import
import { forEach } from "./Loopinator.sol";

// apply to use `array.forEach` syntax
using { forEach } for uint256[]

// define function for each iteration
function notZero(uint256 a) pure returns (uint256) {
    require(a != 0, "number is invalid");
}

contract MyContract {

    function allMustBeNonZero(uint256[] memory numbers) public pure {

        numbers.forEach(notZero);

    }

}
```

### `uint256[].reduce`

The `reduce` function takes `uint256[] memory`, a function that takes two `uint256` values (the
reduced value and the current value, respectively) and returns a `uint256` representing the new
reduced value, and an initial value.

This will loop over the array, executing the function on the reduced value and each element, and
finally returning the reduced value.

**Usage:**

```solidity
// import
import { reduce } from "./Loopinator.sol";

// apply to use `array.reduce` syntax
using { reduce } for uint256[]

// define function for each iteration
function sum(uint256 lastValue, uint256 element) internal pure returns (uint256) {
    return lastValue + element;
}

contract MyContract {

    function sumTheNumbers(uint256[] memory numbers) public pure returns (uint256) {

        uint256 initialValue;

        return numbers.reduce(sum, initialValue);

    }

}
```
