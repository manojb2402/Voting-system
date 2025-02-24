// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Voting {
    struct Candidate {
        string name;
        uint voteCount;
    }

    mapping(uint => Candidate) public candidates;
    uint public candidateCount;

    // Event to log the addition of candidates
    event CandidateAdded(string name, uint candidateCount);

    // Constructor to initialize candidates
    constructor() {
        addCandidate("Alice");
        addCandidate("Bob");
    }

    // Private function to add candidates
    function addCandidate(string memory name) private {
        candidates[candidateCount] = Candidate(name, 0);
        emit CandidateAdded(name, candidateCount); // Emit event
        candidateCount++;
    }

    // Function to get the total number of candidates
    function getCandidateCount() public view returns (uint) {
        return candidateCount;
    }

    // Function to get a candidate by index
    function getCandidate(uint index) public view returns (string memory name, uint voteCount) {
        require(index < candidateCount, "Candidate does not exist");
        Candidate memory candidate = candidates[index];
        return (candidate.name, candidate.voteCount);
    }
}
