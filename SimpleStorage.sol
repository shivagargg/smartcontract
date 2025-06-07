//SPDX-License-Identifier:MIT
pragma solidity 0.8.19; // this is the solidity version
// or >=0.8.18 <0.9.0;
// guide- https://github.com/Cyfrin/foundry-full-course-cu?tab=readme-ov-file
contract SimpleStorage{
    //aut0 initallise to 0 
    uint256 public myfavnumber ;

    uint256[] listoffavnum;//array
    struct person{
        uint256 favnumber;
        string name ;
    }
    person public pat =person({name:"pat", favnumber:10});
    //dynamic array  if [3] static array
    person[] public listofpeople;

    function store(uint256 _favnumber) public{
        myfavnumber =_favnumber;
         
    }
    //view , pure  no spend of gas unless some costing fn calls them 
    // store sends transection 
    // view button is in blue because it doesnt change state
    function retrieve() public view returns (uint256){
        return myfavnumber  ;
    }

    function addperson(string memory _name , uint256 _favnumber ) public{
        person memory newperson = person(_favnumber ,_name);
        listofpeople.push(newperson);
    }
}