// SPDX-License-Identifier: GPL-2.0-or-later

pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {ERC4626, ERC20, IERC20} from "openzeppelin-contracts/token/ERC20/extensions/ERC4626.sol";

contract MyERC4626 is ERC4626 {
    constructor() ERC4626(IERC20(address(0))) ERC20("MyERC4626", "MYERC4626") {}
}

contract Test is Script {
    function run() public {
        vm.startBroadcast();
        for (uint256 i = 0; i < 100; ++i) {
            new MyERC4626();
        }
        vm.stopBroadcast();
    }    
}
