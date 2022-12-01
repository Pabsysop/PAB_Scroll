// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * Partyboard Token
 * @author PARTYBOARD
 */
contract PartyboardToken is ERC20, ERC20Burnable, Ownable {
    constructor() ERC20("PartyboardToken", "PARTY") {
        _mint(msg.sender, 1000000000000000000);
    }
    function decimals() public view virtual override returns (uint8) {
        return 8;
    }
}