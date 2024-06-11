import 'dart:math';

class AI {
  // Low-level AI
  int getMoveLowLevel(List<String> board) {
    List<int> emptyCells = [];
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i * 3 + j] == '') {
          emptyCells.add(i * 3 + j);
        }
      }
    }
    if (emptyCells.isNotEmpty) {
      int randomIndex = Random().nextInt(emptyCells.length);
      return emptyCells[randomIndex];
    }
    return -1;
  }

  // High-level AI
  int getMoveHighLevel(List<String> board) {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i * 3 + j] == '') {
          board[i * 3 + j] = 'O'; // Assume AI's move
          if (_checkWin(board, 'O')) {
            return i * 3 + j;
          }
          board[i * 3 + j] = ''; // Reset for next check
        }
      }
    }

    // Check for potential winning moves for player and block them
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i * 3 + j] == '') {
          board[i * 3 + j] = 'X'; // Assume player's move
          if (_checkWin(board, 'X')) {
            return i * 3 + j; // Block the player
          }
          board[i * 3 + j] = ''; // Reset for next check
        }
      }
    }

    // If no potential winning moves, make a random move
    List<int> emptyCells = [];
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i * 3 + j] == '') {
          emptyCells.add(i * 3 + j);
        }
      }
    }
    if (emptyCells.isNotEmpty) {
      int randomIndex = Random().nextInt(emptyCells.length);
      return emptyCells[randomIndex];
    }
    return -1;
  }

  bool _checkWin(List<String> board, String player) {
    const winPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var pattern in winPatterns) {
      if (board[pattern[0]] == player &&
          board[pattern[1]] == player &&
          board[pattern[2]] == player) {
        return true;
      }
    }
    return false;
  }
}
