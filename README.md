# BlockchainTicTacToe
Deploy a new TicTacToe contract with
```bash
forge create --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY src/Counter.sol:TicTacToe --constructor-args $PLAYER_2_ADDRESS
```

Player 1 is the creator of the contract

Copy contract address to contractAddress variable in index.html
Copy contract ABI to contractABI variable in index.html

Starting local server
```bash
http-server -p 8000
```
Play on the server address (for example local server http://127.0.0.1:8000/)

Install MetaMask before playing
