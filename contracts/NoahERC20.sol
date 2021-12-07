// Solidity files have to start with this pragma.
// It will be used by the Solidity compiler to validate its version.
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// import "../node_modules/hardhat/console.sol";

// This is the main building block for smart contracts.
contract NoahERC20 is ERC20{
    // Some string type variables to identify the token.
    // The `public` modifier makes a variable readable from outside the contract.
    string _name = "NoahERC20";
    string _symbol = "NE20";

    // The fixed amount of tokens stored in an unsigned integer type variable.
    uint256 _totalSupply = 1000000;
    uint256 _decimals = 18;

    // An address type variable is used to store ethereum accounts.
    address public owner;

    // A mapping is a key/value map. Here we store each account balance.
    mapping(address => uint256) balances;

    /**
     * Contract initialization.
     *
     * The `constructor` is executed only once when the contract is created.
     */
    constructor() ERC20(_name, _symbol){
        // The totalSupply is assigned to transaction sender, which is the account
        // that is deploying the contract.
        _mint(msg.sender, _totalSupply * (10 ** _decimals));
        owner = msg.sender;
    }

    /**
     * A function to transfer tokens.
     *
     * The `external` modifier makes a function *only* callable from outside
     * the contract.
     */
    function noah_transfer(address to, uint256 amount) external {
        // console.log("Sender balance is %s tokens", balances[msg.sender]);
        // console.log("Trying to send %s tokens to %s", amount, to);
        
        // Check if the transaction sender has enough tokens.
        // If `require`'s first argument evaluates to `false` then the
        // transaction will revert.
        transfer(to, amount);
    }

    /**
     * Read only function to retrieve the token balance of a given account.
     *
     * The `view` modifier indicates that it doesn't modify the contract's
     * state, which allows us to call it without executing a transaction.
     */
    function noah_balanceOf(address account) external view returns (uint256) {
        return balanceOf(account);
    }
}