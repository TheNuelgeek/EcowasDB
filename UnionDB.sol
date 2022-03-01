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
        Ambassador ambassador; 
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
            string calldata _AmbName,
            string calldata _gender,
            string calldata _nameOfUnion
        )
        external returns(string memory message){
         // string nameOfCountry
        // string nameOfPresident;
        // uint numOfState;
        // uint population;
        // string name;
        // string country;
        Union storage u = unions[_nameOfUnion];
        Country storage c = u.countries[_nameOfCountry];
        require(u.status == true, "No such union!");

        // one liner
        //Country storage uc = unions[_nameOfUnion].countries[_nameOfCountry];

        c.nameOfCountry = _nameOfCountry;
        c.nameOfPresident = _nameOfPresident;
        c.numOfState = _numOfState;
        c.ambassador.name = _AmbName;
        c.ambassador.gender = _gender;
        c.population = _population;

        u.country.push(_nameOfCountry);
        message = "!Member of the Union creatd";
    }

    function seeUnion(string calldata _nameOfU) external view returns(UnionV2 memory _u){
        Union storage u = unions[_nameOfU];
        // string nameOfUnion;
        // string[] country;
        // bool status;
        _u.nameOfUnion = u.nameOfUnion;
        _u.country = u.country;
    }  

    function seeAllUnion(string[] memory _nameOfu) external view returns(UnionV2[] memory _u){
        _u = new UnionV2[](_nameOfu.length);
        for(uint i = 0; i < _nameOfu.length; i++){
            Union storage u = unions[_nameOfu[i]];
            require(u.status == true, "One of your inputs is incorrect");
            // _u[i] = u.country
            _u[i].nameOfUnion = u.nameOfUnion;
            _u[i].country = u.country;
        }
    }  


       
}     