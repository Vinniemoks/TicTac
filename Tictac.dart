import 'dart:io';

class TicTacToe {
  List<String> board = List.generate(9, (index) => (index + 1).toString());
  String currentPlayer = 'X';

  // Method to display the Tic Tac Toe board
  void displayBoard() {
    print('-------------');
    print('| ${board[0]} | ${board[1]} | ${board[2]} |');
    print('-------------');
    print('| ${board[3]} | ${board[4]} | ${board[5]} |');
    print('-------------');
    print('| ${board[6]} | ${board[7]} | ${board[8]} |');
    print('-------------');
  }

  // Method to check if the game is won
  bool checkWin() {
    // Check rows
    for (int i = 0; i < 9; i += 3) {
      if (board[i] == board[i + 1] && board[i + 1] == board[i + 2]) {
        return true;
      }
    }
    // Check columns
    for (int i = 0; i < 3; i++) {
      if (board[i] == board[i + 3] && board[i + 3] == board[i + 6]) {
        return true;
      }
    }
    // Check diagonals
    if (board[0] == board[4] && board[4] == board[8]) {
      return true;
    }
    if (board[2] == board[4] && board[4] == board[6]) {
      return true;
    }
    return false;
  }

  // Method to check if the game is a tie
  bool checkTie() {
    for (int i = 0; i < 9; i++) {
      if (board[i] != 'X' && board[i] != 'O') {
        return false;
      }
    }
    return true;
  }

  // Method to handle player moves
  void makeMove(int position) {
    if (board[position - 1] != 'X' && board[position - 1] != 'O') {
      board[position - 1] = currentPlayer;
      currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
    } else {
      print('Invalid move! Position already taken.');
    }
  }
}

void main() {
  TicTacToe game = TicTacToe();
  bool gameEnded = false;

  while (!gameEnded) {
    game.displayBoard();
    stdout.write('${game.currentPlayer}, enter your move (1-9): ');
    int position = int.parse(stdin.readLineSync()!);
    game.makeMove(position);
    if (game.checkWin()) {
      game.displayBoard();
      print('${game.currentPlayer} wins!');
      gameEnded = true;
    } else if (game.checkTie()) {
      game.displayBoard();
      print('It\'s a tie!');
      gameEnded = true;
    }
  }
}
