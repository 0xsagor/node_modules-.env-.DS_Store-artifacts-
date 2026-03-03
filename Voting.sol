// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title Voting
 * @dev A simple decentralized voting contract for on-chain governance.
 */
contract Voting is Ownable {

    struct Proposal {
        string description;
        uint256 voteCount;
    }

    mapping(uint256 => Proposal) public proposals;
    mapping(uint256 => mapping(address => bool)) public hasVoted;
    uint256 public proposalCount;

    event ProposalAdded(uint256 indexed id, string description);
    event Voted(uint256 indexed id, address indexed voter);

    constructor() Ownable(msg.sender) {}

    /**
     * @dev Create a new proposal for users to vote on.
     * @param description The text describing the proposal.
     */
    function addProposal(string memory description) public onlyOwner {
        proposals[proposalCount] = Proposal(description, 0);
        emit ProposalAdded(proposalCount, description);
        proposalCount++;
    }

    /**
     * @dev Cast a vote for a specific proposal.
     * @param proposalId The ID of the proposal to vote for.
     */
    function vote(uint256 proposalId) public {
        require(proposalId < proposalCount, "Invalid proposal ID");
        require(!hasVoted[proposalId][msg.sender], "Already voted on this proposal");

        proposals[proposalId].voteCount++;
        hasVoted[proposalId][msg.sender] = true;

        emit Voted(proposalId, msg.sender);
    }

    /**
     * @dev Get the total votes for a specific proposal.
     */
    function getResults(uint256 proposalId) public view returns (uint256) {
        require(proposalId < proposalCount, "Invalid proposal ID");
        return proposals[proposalId].voteCount;
    }
}
