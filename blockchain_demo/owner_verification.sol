// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Authentication {
    mapping(string => string) private huidToAadhar;

    
    constructor() {
        huidToAadhar["testHUID123"] = "testAadhar456";
    }

    function authenticate(string memory inputHUID, string memory inputAadhar) public view returns (string memory) {
        string memory storedAadhar = huidToAadhar[inputHUID];
        
        if (compareStrings(storedAadhar, inputAadhar)) {
            return "Confirmed";
        } else {
            return "Sorry, authentication failed";
        }
    }

    // Function to compare two strings
    function compareStrings(string memory a, string memory b) internal pure returns (bool) {
        return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b))));
    }
}