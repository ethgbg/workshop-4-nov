pragma solidity ^0.4.18;

contract Election {

    string public name;
    mapping (string => uint) candidateVotes;
    mapping (address => bool) public hasVoted;

    function Election(string _name) public {
        name = _name;
    }

    function voteForCandidate(string _candidate) public returns (bool success) {
        if (!hasVoted[msg.sender]) {
            candidateVotes[_candidate] += 1;
            hasVoted[msg.sender] = true;
            success = true;
        } else {
            success = false;
        }
        return success;
    }

    function getVotesForCandidate(string _candidate) public view returns (uint votes) {
        return candidateVotes[_candidate];
    }

}
