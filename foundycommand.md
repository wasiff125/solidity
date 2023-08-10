[MY INSTAGRAM](https://www.instagram.com/WASIFF_125/)

# COMPILING IN FOUNDRY
This is how we compile smart contract in foundry using forge compile command
```
forge compile
```

# DEPLOYING IN FOUNDRY
This is how we deploy smart contract in foundry using forge create command
  - Define RPC URL & PRIVATE KEY in .env and run following command
```
source .env
```
  - After running above command deploy the contract using following command given below
```
forge create SMARTCONTRACT.sol --rpc-url $RPC_URL --private-key $PRIVATE_KEY
```
