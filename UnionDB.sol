// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// create union(view deatils of each members(001, population and state numbers) check the numbers of countries in each union)

//Ambassador = Amb

// create union
// add countries and search for them when needed
// add Amb to country
// change Amb

contract UnionDB{

    // VARIABLES

    struct Union{
        string nameOfUnion;
        string[] country;
        bool status;
        mapping(string => Country) countries;
    }

    struct UnionV2{
        string nameOfUnion;
        string[] country;
        bool status;
    }

    mapping(string => Union) unions;

    //=====================================

    struct Country{
        string nameOfCountry;
        string nameOfPresident;
        uint numOfState;
        uint population;
        Ambassadorg ambassador; 
    }

    struct CountryV2{
        string nameOfPresident;
        uint numOfState;
        uint population;
    }

    struct Ambassador{
        string name;
        string gender;
    }

    // fUNCTIONS

    function createUnion(string calldata _nameOfUnion)external returns(bool){
        Union storage u = unions[_nameOfUnion];
        u.nameOfUnion = _nameOfUnion;
        return u.status = true;
    }

    function registerCountry(
            string calldata _nameOfCountry,
            string calldata _nameOfPresident,
            uint _numOfState,
            uint _population,
            string calldata AmbName,
            string calldata gender
        )
        external returns(string memory message){
         // string nameOfCountry
        // string nameOfPresident;
        // uint numOfState;
        // uint population;
        // string name;

        // string country;
    }
       
}     