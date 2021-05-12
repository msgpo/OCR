// SPDX-License-Identifier: MIT
pragma solidity ^0.7.1;

import "./OffchainAggregator.sol";
import "./SimpleReadAccessController.sol";

/**
 * @notice Wrapper of OffchainAggregator which checks read access on Aggregator-interface methods
 */
contract AccessControlledOffchainAggregator is
    OffchainAggregator,
    SimpleReadAccessController
{
    constructor(
        uint32 _maximumGasPrice,
        uint32 _reasonableGasPrice,
        uint32 _microLinkPerEth,
        uint32 _linkGweiPerObservation,
        uint32 _linkGweiPerTransmission,
        address _link,
        AccessControllerInterface _billingAccessController,
        AccessControllerInterface _requesterAccessController,
        uint8 _decimals,
        string memory description
    )
        OffchainAggregator(
            _maximumGasPrice,
            _reasonableGasPrice,
            _microLinkPerEth,
            _linkGweiPerObservation,
            _linkGweiPerTransmission,
            _link,
            _billingAccessController,
            _requesterAccessController,
            _decimals,
            description
        )
    {}

    /*
     * v2 Aggregator interface
     */

    /// @inheritdoc OffchainAggregator
    function latestAnswer()
        public
        view
        override
        checkAccess()
        returns (
            bytes32,
            uint8,
            bytes32,
            bytes32,
            bytes32[] memory
        )
    {
        return super.latestAnswer();
    }

    /// @inheritdoc OffchainAggregator
    function latestTimestamp()
        public
        view
        override
        checkAccess()
        returns (uint256)
    {
        return super.latestTimestamp();
    }

    /// @inheritdoc OffchainAggregator
    function latestRound()
        public
        view
        override
        checkAccess()
        returns (uint256)
    {
        return super.latestRound();
    }

    /// @inheritdoc OffchainAggregator
    function getAnswer(uint256 _roundId)
        public
        view
        override
        checkAccess()
        returns (
            bytes32,
            uint8,
            bytes32,
            bytes32,
            bytes32[] memory
        )
    {
        return super.getAnswer(_roundId);
    }

    function getAnswerByIndex(uint256 _roundId, uint8 _index)
        public
        view
        override
        checkAccess()
        returns (
          string memory
        )
    {
        return super.getAnswerByIndex(_roundId, _index);
    }

    /// @inheritdoc OffchainAggregator
    function getTimestamp(uint256 _roundId)
        public
        view
        override
        checkAccess()
        returns (uint256)
    {
        return super.getTimestamp(_roundId);
    }

    /*
     * v3 Aggregator interface
     */

    /// @inheritdoc OffchainAggregator
    function description()
        public
        view
        override
        checkAccess()
        returns (string memory)
    {
        return super.description();
    }

    /// @inheritdoc OffchainAggregator
    function getRoundData(uint80 _roundId)
        public
        view
        override
        checkAccess()
        returns (
            uint80,
            bytes32,
            uint8,
            bytes32,
            bytes32,
            bytes32[] memory,
            uint256
        )
    {
        return super.getRoundData(_roundId);
    }

    /// @inheritdoc OffchainAggregator
    function latestRoundData()
        public
        view
        override
        checkAccess()
        returns (
            uint80,
            bytes32,
            uint8,
            bytes32,
            bytes32,
            bytes32[] memory,
            uint256
        )
    {
        return super.latestRoundData();
    }
}
