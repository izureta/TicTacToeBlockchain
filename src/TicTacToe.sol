pragma solidity ^0.8.0;

contract TicTacToe {
    address public player1;
    address public player2;
    uint8[3][3] public board;
    uint8 public turn;
    address public currentPlayer;

    constructor(address _player2) {
        player1 = msg.sender;
        player2 = _player2;
        currentPlayer = player1;
        turn = 0;
    }

    modifier onlyPlayers() {
        require(msg.sender == player1 || msg.sender == player2, "Not a player");
        _;
    }

    modifier correctPlayer() {
        require(msg.sender == currentPlayer, "Not your turn");
        _;
    }

    modifier validMove(uint8 x, uint8 y) {
        require(x < 3 && y < 3, "Invalid move");
        require(x >= 0 && y >= 0, "Invalid move");
        require(board[x][y] == 0, "Cell already filled");
        require(checkWinner() == address(0), "Game is over");
        _;
    }

    function makeMove(uint8 x, uint8 y) public onlyPlayers correctPlayer validMove(x, y) {
        if (turn % 2 == 0) {
            board[x][y] = 1;
            currentPlayer = player2;
        } else {
            board[x][y] = 2;
            currentPlayer = player1;
        }
        turn += 1;
    }

    function checkWinner() public view returns (address) {
        // Rows
        for (uint8 i = 0; i < 3; i++) {
            if (board[i][0] == board[i][1] && board[i][1] == board[i][2] && board[i][0] != 0) {
                return board[i][0] == 1 ? player1 : player2;
            }
        }
        // Columns
        for (uint8 i = 0; i < 3; i++) {
            if (board[0][i] == board[1][i] && board[1][i] == board[2][i] && board[0][i] != 0) {
                return board[0][i] == 1 ? player1 : player2;
            }
        }
        // Diagonals
        if (board[0][0] == board[1][1] && board[1][1] == board[2][2] && board[0][0] != 0) {
            return board[0][0] == 1 ? player1 : player2;
        }
        if (board[0][2] == board[1][1] && board[1][1] == board[2][0] && board[0][2] != 0) {
            return board[0][2] == 1 ? player1 : player2;
        }
        // No winner
        return address(0);
    }
}
