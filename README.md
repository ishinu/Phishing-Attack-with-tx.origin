# Phishing Attack with tx.origin

A smart contract which holds Ether and needs a permisssion of a specific address like owner to allow for performing transactions shall always check msg.sender instead of tx.origin.

In a few cases, it may happen that an attacker would create a contract like `Attack.sol` in this project and somehow make the victim `Owner of EtherBank.sol` to send a transaction to an address.

Now you may know this that if victim send a transaction with enough gas to a contract ` assuming of just an address since etherscan doesn't display contracts by default ` which is having a fallback(), it may re-direct your call and perform malicious activity.

In our project, attack function was called from `Attack.sol` but when it reaches `EtherBank.sol`, the tx.origin is the one who initiated the transaction which is victim.

This way Phishing attacks steals Ether from a contract with such functionality.

## Prevention 

In most cases, use msg.sender instead of tx.origin for condition checks as it will detect the read address which called the function.