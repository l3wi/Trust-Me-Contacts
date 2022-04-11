// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "trustus/Trustus.sol";
import {BaseTest, console} from "./base/BaseTest.sol";
import "../TrustMe.sol";


contract ContractTest is BaseTest {
    TrustMe token;
    
    function setUp() public {
        token = new TrustMe("Trust Me", "TME", "testing", 0x14791697260E4c9A71f18484C9f997B308e59325);
    }
    
    function testInvariantMetadata() public {
        assertEq(token.name(), "Trust Me");
        assertEq(token.symbol(), "TME");
    }

    function testTokeURI() public {
        assertEq(token.baseURI(), "testing");
    }

    // function testMint() public {
    //      assertEq(token.balanceOf(address(this)), 0);

    //     token.mint(
    //         0x6d696e7454727573744d65000000000000000000000000000000000000000000,
    //         Trustus.TrustusPacket(
    //             27,
    //             0x8dd55ff286e7dae7b25a1142de2eaf0a0407787397dd81c79e3c8c364cf89934,
    //             0x3e8020c4d7a7c4315e629ff6813ecd40989fc5890dc2ac474d88de7dcb3878c5,
    //             0x6d696e7454727573744d65000000000000000000000000000000000000000000,
    //             1649541536,
    //             9e47b136baeb122173030adb01ae11b97fc9f0e6545266e5a244af089a8d52ec
    //         )
    //     );
        
    //     assertEq(token.balanceOf(address(this)), 1);
    //     assertEq(token.totalSupply(), 1);
    // }


    // function testFailMultiMint() public {
    //     token.mint(
    //         0x6d696e7454727573744d65000000000000000000000000000000000000000000,
    //         Trustus.TrustusPacket(
    //             28,
    //             0x5fac34f4b06c72942bdf511cbdd262f55c185dcd296b29811f30b12395fc0ac1,
    //             0x0522ab50253023cffb36504994386a0652344504402c040b1498479d81596fad,
    //             0x6d696e7454727573744d65000000000000000000000000000000000000000000,
    //             1649541536,
    //             0x9e47b136baeb122173030adb01ae11b97fc9f0e6545266e5a244af089a8d52ec
    //         )
    //     );
        
    //     token.mint(
    //         0x6d696e7454727573744d65000000000000000000000000000000000000000000,
    //         Trustus.TrustusPacket(
    //             28,
    //             0x5fac34f4b06c72942bdf511cbdd262f55c185dcd296b29811f30b12395fc0ac1,
    //             0x0522ab50253023cffb36504994386a0652344504402c040b1498479d81596fad,
    //             0x6d696e7454727573744d65000000000000000000000000000000000000000000,
    //             1649541536,
    //             0x9e47b136baeb122173030adb01ae11b97fc9f0e6545266e5a244af089a8d52ec
    //         )
    //     );
    // }
    

}
