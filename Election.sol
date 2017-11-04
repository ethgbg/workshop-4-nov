pragma solidity ^0.4.18;

contract Election {
    
    string public name;
    address public creator;
    mapping (bytes16 => uint) public votes;
    mapping (address => bool) public hasVoted;
    
    function Election(string _name) public {
        name = _name;
        creator = msg.sender;
    }
    
    modifier onlyCreator() {
        require((msg.sender == creator));
        _;
    }
    
    function rename(string _name) onlyCreator public {
        name = _name;
    }

    function voteForCandidate(bytes16 _candidate) public {
        if (!hasVoted[msg.sender]) {
            votes[_candidate] += 1;
            hasVoted[msg.sender] = true;           
        }
    }
}
