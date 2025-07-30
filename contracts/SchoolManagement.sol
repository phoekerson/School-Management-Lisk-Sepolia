// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

contract management{
    address public addressOwner;
    uint public tuitionfee = 0.000005 ether;

    mapping (address => bool) public haspaid;

    constructor() {
        addressOwner = msg.sender;
    }



    // Funtion to let student pay the tuition
    function tuitionstudentpay() public payable{
        require(msg.value == tuitionfee, "The amount is not enough to pay the tuition");
        require(!haspaid[msg.sender], "You have already pay the tuition");
        haspaid[msg.sender] = true;
    }

    //Funtion for instructor to verify the tuitionfee pay by the student
    function verifythetuition(address student) public view returns (bool){
        require(msg.sender == addressOwner, "The instructor is the only for check tuition pay");
        return haspaid[student];
    }

    function withdraw() public{
        require(msg.sender == addressOwner,"Only the instructor can withdraw");
        payable(addressOwner).transfer(address(this).balance);

    }
}
