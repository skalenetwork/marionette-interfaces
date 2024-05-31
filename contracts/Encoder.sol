// SPDX-License-Identifier: AGPL-3.0-only

/*
    Encoder.sol - Marionette
    Copyright (C) 2021-Present SKALE Labs
    @author Dmytro Stebaiev

    Marionette is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Marionette is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with Marionette.  If not, see <https://www.gnu.org/licenses/>.
*/

pragma solidity ^0.8.0;


library Encoder {
    struct FunctionCall {
        address receiver;
        uint256 value;
        bytes data;
    }

    // Functions are used by the library users
    // slither-disable-start dead-code

    function encodeFunctionCall(
        address receiver,
        uint256 value,
        bytes memory data
    )
        internal
        pure
        returns (bytes memory encodedFunctionCall)
    {
        return abi.encode(receiver, value, data);
    }

    function decodeFunctionCall(bytes calldata data) internal pure returns (FunctionCall memory functionCall) {
        (functionCall.receiver, functionCall.value, functionCall.data) = abi.decode(data, (address, uint256, bytes));
    }

    // slither-disable-end dead-code
}
