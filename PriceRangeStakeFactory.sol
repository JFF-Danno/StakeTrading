pragma solidity >=0.4.22 <0.8.0;

import "./PriceRangeStake.sol";
import "./PrizePool.sol";

contract PriceRangeStakeFactory {

    constructor() public {
        createContracts();
    }

    address[] Contracts;

    function createContract (bytes32 name, uint256 low, uint256 high) private {
        address newContract = address( new PriceRangeStake(name,low,high) );
        Contracts.push(newContract);
    }

    function createContracts() private 
    { 
        createContract ("30k - 32k", 25000000000000000000, 26666666667000000000 );

        createContract ("32k - 34k", 26666666667000000001, 28333333333000000000 );

        createContract ("34k - 36k", 28333333333000000001, 30000000000000000000 );

        createContract ("36k - 38k", 30000000000000000001, 31666666667000000000 );

        createContract ("38k - 40k", 31666666667000000001, 35500000000000000000 );

    }

    function getContractAddress(uint cnt) public view returns (address)
    {
        address out = Contracts[cnt];
        return out;
    }   
   
}
