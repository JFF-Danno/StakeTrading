pragma solidity >=0.4.22 <0.8.0;

contract CrazyFauxPriceFeed {

    uint256 price;

    constructor(uint256 startPrice) public {

        price = startPrice;
    }
   
    uint256[] incs = [ 51000000000000000 , 10000000004440000, 500000000000000000, 34000000000000000 , 200000000000000000 ];
    function getPrice(uint256 oldPrice, uint random) public view returns (uint256)
    {   
                
            if ( oldPrice < 31546864999998222400 )
            {
                return oldPrice + 1000000000000000000;
            }
            if ( oldPrice > 32100000000000000000 )
            {
                return oldPrice - 1000000000000000000;
            }
              return 31546864999998222400;    
 
    }

    function random() public view returns (uint) {
        return getnow() % 2;
    }

    function getnow() public view returns (uint) {
        return now;
    }

}
