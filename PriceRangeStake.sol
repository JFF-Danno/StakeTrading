pragma solidity >=0.4.22 <0.8.0;

contract PriceRangeStake {
   
    address owner;
    bytes32 name;
    uint256 lowPrice;
    uint256 highPrice;
    mapping(address => uint) public balances;
    mapping(address => uint) public stakesize;
  
    constructor( bytes32 _name, uint256 _lowPrice, uint256 _highPrice ) public {

        owner       = msg.sender;
        name        = _name;
        lowPrice    = _lowPrice;
        highPrice   = _highPrice;

       // prizePoolContract = prizePool;
       // boo having issues with sending between contracts within solidity????
       // handling prize pools in this contract for now. Just need to add liquidity via pretend "impatient stakers".
    }

    uint256 prizePool = 0;
    uint256 moneyStored = 0;
    uint    holders = 0;

    function addMoney() payable public 
    {
        //assumption of always recieving 10 eth

        if ( balances[msg.sender] < 1 )
        {
            holders++;
        }
        stakesize[msg.sender] += 1;
        balances[msg.sender] += ( 9 ether );
        moneyStored += ( 9 ether );
        prizePool += ( 1 ether );
    }

    function removeMoney( uint pings ) public returns(uint)
    {
        uint rewards = stakesize[msg.sender] * pings * 1000;
        prizePool    -= rewards; 
        uint toPay   = ( stakesize[msg.sender] * 9 ether ) + rewards;
        moneyStored -= ( stakesize[msg.sender] * 9 ether );
        stakesize[msg.sender]   = 0;
        balances[msg.sender]    = 0;
        holders--;
        msg.sender.transfer(toPay);
        return toPay;
    }

    function getMoneyStored() public view returns (uint256){
        return moneyStored;
    }

    function getName() public view returns (bytes32){
        return name;
    }

    function getMyBalance(address myAddress) public view  returns (uint){
        return balances[myAddress];
    }

    function getTotalHolders() public view  returns (uint){
     
        return holders;
    }

    function getTotalPrizePool() public view  returns (uint){
     
        return prizePool;
    }

    function isCurrentStake(uint256 price) public view returns (bool){
        if ( price > lowPrice && price <= highPrice )        
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    function getlowPrice() public view returns (uint256){
        return lowPrice;
    }

    function getHighPrice() public view returns (uint256){
        return highPrice;
    }
}
