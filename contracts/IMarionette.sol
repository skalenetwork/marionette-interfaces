// SPDX-License-Identifier: AGPL-3.0-only

/*
    IMarionette.sol - Marionette
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

import {IMessageReceiver} from "@skalenetwork/ima-interfaces/IMessageReceiver.sol";


interface IMarionette is IMessageReceiver {
    receive() external payable;
    function execute(
        address payable target,
        uint256 value,
        bytes calldata data
    )
        external
        payable
        returns (bytes memory returnValue);
    function initialize(address owner, address ima) external;
    function setVersion(string calldata newVersion) external;
    function sendSFuel(address payable target, uint256 value) external payable;
    function encodeFunctionCall(
        address receiver,
        uint256 value,
        bytes calldata data
    )
        external
        pure
        returns (bytes memory encodedFunctionCall);
}
