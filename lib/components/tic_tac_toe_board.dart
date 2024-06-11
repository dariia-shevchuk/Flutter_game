// import 'package:flutter/material.dart';
// import 'package:game/services/ai.dart';
// import 'package:game/services/statistics.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class TicTacToeBoard extends StatefulWidget {
//   final bool isVsAI;
//
//   TicTacToeBoard({required this.isVsAI});
//
//   @override
//   _TicTacToeBoardState createState() => _TicTacToeBoardState();
// }
//
// class _TicTacToeBoardState extends State<TicTacToeBoard> {
//   List<String> _board = List.filled(9, '');
//   bool _isXTurn = true;
//   AI _ai = AI();
//   Statistics _statistics = Statistics();
//   String _aiDifficulty = 'low';
//
//   @override
//   void initState() {
//     super.initState();
//     _loadAIDifficulty();
//   }
//
//   void _loadAIDifficulty() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _aiDifficulty = prefs.getString('aiDifficulty') ?? 'low';
//     });
//   }
//
//   void _handleTap(int index) {
//     if (_board[index] == '') {
//       setState(() {
//         _board[index] = _isXTurn ? 'X' : 'O';
//         if (_checkWin(_isXTurn ? 'X' : 'O')) {
//           _statistics.incrementGamesPlayed();
//           if (_isXTurn) {
//             _statistics.incrementGamesWon();
//           }
//           _showWinDialog(_isXTurn ? 'X' : 'O');
//         } else if (!_board.contains('')) {
//           _statistics.incrementGamesPlayed();
//           _showDrawDialog();
//         }
//         _isXTurn = !_isXTurn;
//       });
//
//       if (widget.isVsAI && !_isXTurn) {
//         _aiMove();
//       }
//     }
//   }
//
//   void _aiMove() {
//     int aiMove;
//     if (_aiDifficulty == 'low') {
//       aiMove = _ai.getMoveLowLevel(_board);
//     } else {
//       aiMove = _ai.getMoveHighLevel(_board);
//     }
//
//     setState(() {
//       _board[aiMove] = 'O';
//       if (_checkWin('O')) {
//         _statistics.incrementGamesPlayed();
//         _showWinDialog('O');
//       } else if (!_board.contains('')) {
//         _statistics.incrementGamesPlayed();
//         _showDrawDialog();
//       }
//       _isXTurn = !_isXTurn;
//     });
//   }
//
//   bool _checkWin(String player) {
//     const winPatterns = [
//       [0, 1, 2],
//       [3, 4, 5],
//       [6, 7, 8],
//       [0, 3, 6],
//       [1, 4, 7],
//       [2, 5, 8],
//       [0, 4, 8],
//       [2, 4, 6],
//     ];
//
//     for (var pattern in winPatterns) {
//       if (_board[pattern[0]] == player &&
//           _board[pattern[1]] == player &&
//           _board[pattern[2]] == player) {
//         return true;
//       }
//     }
//     return false;
//   }
//
//   void _showWinDialog(String winner) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Game Over"),
//           content: Text("$winner wins!"),
//           actions: <Widget>[
//             TextButton(
//               child: Text("OK"),
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 _resetBoard();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _showDrawDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Game Over"),
//           content: Text("It's a draw!"),
//           actions: <Widget>[
//             TextButton(
//               child: Text("OK"),
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 _resetBoard();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _resetBoard() {
//     setState(() {
//       _board = List.filled(9, '');
//       _isXTurn = true;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
//       itemBuilder: (context, index) {
//         return GestureDetector(
//           onTap: () => _handleTap(index),
//           child: Container(
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.black),
//             ),
//             child: Center(
//               child: Text(
//                 _board[index],
//                 style: TextStyle(fontSize: 40),
//               ),
//             ),
//           ),
//         );
//       },
//       itemCount: 9,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:game/services/ai.dart';
import 'package:game/services/statistics.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TicTacToeBoard extends StatefulWidget {
  final bool isVsAI;

  TicTacToeBoard({required this.isVsAI});

  @override
  _TicTacToeBoardState createState() => _TicTacToeBoardState();
}

class _TicTacToeBoardState extends State<TicTacToeBoard> {
  List<String> _board = List.filled(9, '');
  bool _isXTurn = true;
  AI _ai = AI();
  Statistics _statistics = Statistics();
  String _aiDifficulty = 'low';

  @override
  void initState() {
    super.initState();
    _loadAIDifficulty();
  }

  void _loadAIDifficulty() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _aiDifficulty = prefs.getString('aiDifficulty') ?? 'low';
    });
  }

  void _handleTap(int index) {
    if (_board[index] == '') {
      setState(() {
        _board[index] = _isXTurn ? 'X' : 'O';
        if (_checkWin(_isXTurn ? 'X' : 'O')) {
          _statistics.incrementGamesPlayed();
          if (_isXTurn) {
            _statistics.incrementGamesWon();
          }
          _showWinDialog(_isXTurn ? 'X' : 'O');
          return; // Stop here if the game is won
        } else if (!_board.contains('')) {
          _statistics.incrementGamesPlayed();
          _showDrawDialog();
          return; // Stop here if the game is a draw
        }
        _isXTurn = !_isXTurn;
      });

      if (widget.isVsAI && !_isXTurn) {
        _aiMove();
      }
    }
  }

  void _aiMove() {
    int aiMove;
    if (_aiDifficulty == 'low') {
      aiMove = _ai.getMoveLowLevel(_board);
    } else {
      aiMove = _ai.getMoveHighLevel(_board);
    }

    setState(() {
      _board[aiMove] = 'O';
      if (_checkWin('O')) {
        _statistics.incrementGamesPlayed();
        _showWinDialog('O');
      } else if (!_board.contains('')) {
        _statistics.incrementGamesPlayed();
        _showDrawDialog();
      }
      _isXTurn = !_isXTurn;
    });
  }

  bool _checkWin(String player) {
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
      if (_board[pattern[0]] == player &&
          _board[pattern[1]] == player &&
          _board[pattern[2]] == player) {
        return true;
      }
    }
    return false;
  }

  void _showWinDialog(String winner) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Game Over"),
          content: Text("$winner wins!"),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                _resetBoard();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDrawDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Game Over"),
          content: Text("It's a draw!"),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                _resetBoard();
              },
            ),
          ],
        );
      },
    );
  }

  void _resetBoard() {
    setState(() {
      _board = List.filled(9, '');
      _isXTurn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _handleTap(index),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Center(
                child: Text(
                  _board[index],
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
          );
        },
        itemCount: 9,
      ),
    );
  }
}

