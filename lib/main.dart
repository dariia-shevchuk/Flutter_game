// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   bool oTurn = true;
//
//   List<String> displayElement = ['', '', '', '', '', '', '', '', ''];
//   int oScore = 0;
//   int xScore = 0;
//   int filledBoxes = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.pink[900],
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: Container(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.all(30.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Text(
//                           'Player X',
//                           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
//                         ),
//                         Text(
//                           xScore.toString(),
//                           style: TextStyle(fontSize: 20, color: Colors.white),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(30.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Text('Player O', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
//                         Text(
//                           oScore.toString(),
//                           style: TextStyle(fontSize: 20, color: Colors.white),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 4,
//             child: GridView.builder(
//               itemCount: 9,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
//               itemBuilder: (BuildContext context, int index) {
//                 return GestureDetector(
//                   onTap: () {
//                     _tapped(index);
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(border: Border.all(color: Colors.white)),
//                     child: Center(
//                       child: Text(
//                         displayElement[index],
//                         style: TextStyle(color: Colors.white, fontSize: 35),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Expanded(
//             child: Container(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   ElevatedButton( // Change RaisedButton to ElevatedButton
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(Colors.indigo[50]),
//                       foregroundColor: MaterialStateProperty.all(Colors.black),
//                     ),
//                     onPressed: _clearScoreBoard,
//                     child: Text("Clear Score Board"),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   void _tapped(int index) {
//     setState(() {
//       if (oTurn && displayElement[index] == '') {
//         displayElement[index] = 'O';
//         filledBoxes++;
//       } else if (!oTurn && displayElement[index] == '') {
//         displayElement[index] = 'X';
//         filledBoxes++;
//       }
//
//       oTurn = !oTurn;
//       _checkWinner();
//     });
//   }
//
//   void _checkWinner() {
//     // Checking rows
//     if (displayElement[0] == displayElement[1] && displayElement[0] == displayElement[2] && displayElement[0] != '') {
//       _showWinDialog(displayElement[0]);
//     }
//     if (displayElement[3] == displayElement[4] && displayElement[3] == displayElement[5] && displayElement[3] != '') {
//       _showWinDialog(displayElement[3]);
//     }
//     if (displayElement[6] == displayElement[7] && displayElement[6] == displayElement[8] && displayElement[6] != '') {
//       _showWinDialog(displayElement[6]);
//     }
//
//     // Checking Column
//     if (displayElement[0] == displayElement[3] && displayElement[0] == displayElement[6] && displayElement[0] != '') {
//       _showWinDialog(displayElement[0]);
//     }
//     if (displayElement[1] == displayElement[4] && displayElement[1] == displayElement[7] && displayElement[1] != '') {
//       _showWinDialog(displayElement[1]);
//     }
//     if (displayElement[2] == displayElement[5] && displayElement[2] == displayElement[8] && displayElement[2] != '') {
//       _showWinDialog(displayElement[2]);
//     }
//
//     // Checking Diagonal
//     if (displayElement[0] == displayElement[4] && displayElement[0] == displayElement[8] && displayElement[0] != '') {
//       _showWinDialog(displayElement[0]);
//     }
//     if (displayElement[2] == displayElement[4] && displayElement[2] == displayElement[6] && displayElement[2] != '') {
//       _showWinDialog(displayElement[2]);
//     } else if (filledBoxes == 9) {
//       _showDrawDialog();
//     }
//   }
//
//   void _showWinDialog(String winner) {
//     showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("\" " + winner + " \" is Winner!!!"),
//           actions: [
//             TextButton( // Change FlatButton to TextButton
//               child: Text("Play Again"),
//               onPressed: () {
//                 _clearBoard();
//                 Navigator.of(context).pop();
//               },
//             )
//           ],
//         );
//       },
//     );
//
//     if (winner == 'O') {
//       oScore++;
//     } else if (winner == 'X') {
//       xScore++;
//     }
//   }
//
//   void _showDrawDialog() {
//     showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Draw"),
//           actions: [
//             TextButton( // Change FlatButton to TextButton
//               child: Text("Play Again"),
//               onPressed: () {
//                 _clearBoard();
//                 Navigator.of(context).pop();
//               },
//             )
//           ],
//         );
//       },
//     );
//   }
//
//   void _clearBoard() {
//     setState(() {
//       for (int i = 0; i < 9; i++) {
//         displayElement[i] = '';
//       }
//     });
//
//     filledBoxes = 0;
//   }
//
//   void _clearScoreBoard() {
//     setState(() {
//       xScore = 0;
//       oScore = 0;
//       for (int i = 0; i < 9; i++) {
//         displayElement[i] = '';
//       }
//     });
//     filledBoxes = 0;
//   }
// }

// import 'package:flutter/material.dart';
/////////


// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() {
//   runApp(TicTacToeApp());
// }
//
// class TicTacToeApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Tic Tac Toe',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MainMenu(),
//     );
//   }
// }
//
// class MainMenu extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Tic Tac Toe'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => GameScreen()),
//                 );
//               },
//               child: Text('Play with AI'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Navigate to screen to play against another person
//               },
//               child: Text('Play with Another Person'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Navigate to screen to change AI difficulty
//               },
//               child: Text('Change AI Difficulty'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Navigate to screen to view global statistics
//               },
//               child: Text('Global Statistics'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class GameScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Tic Tac Toe - Game'),
//       ),
//       body: Center(
//         child: Text('Game Screen'),
//       ),
//     );
//   }
// }

// import 'dart:math';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(TicTacToeApp());
// }
//
// class TicTacToeApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Tic Tac Toe',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: TicTacToeScreen(),
//     );
//   }
// }
//
// class TicTacToeScreen extends StatefulWidget {
//   @override
//   _TicTacToeScreenState createState() => _TicTacToeScreenState();
// }
//
// class _TicTacToeScreenState extends State<TicTacToeScreen> {
//   late List<List<String>> _board;
//   late bool _isPlayer1Turn;
//   late bool _isGameOver;
//
//   @override
//   void initState() {
//     super.initState();
//     _initBoard();
//   }
//
//   void _initBoard() {
//     _board = List.generate(3, (_) => List.generate(3, (_) => ''));
//     _isPlayer1Turn = true;
//     _isGameOver = false;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Tic Tac Toe'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             GridView.builder(
//               shrinkWrap: true,
//               gridDelegate:
//               SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
//               itemCount: 9,
//               itemBuilder: (context, index) {
//                 int row = index ~/ 3;
//                 int col = index % 3;
//                 return GestureDetector(
//                   onTap: () {
//                     _onTapTile(row, col);
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(),
//                     ),
//                     child: Center(
//                       child: Text(
//                         _board[row][col],
//                         style: TextStyle(fontSize: 40),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//             if (_isGameOver)
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     _initBoard();
//                   });
//                 },
//                 child: Text('Restart'),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // void _onTapTile(int row, int col) {
//   //   if (!_isGameOver && _board[row][col] == '') {
//   //     setState(() {
//   //       _board[row][col] = _isPlayer1Turn ? 'X' : 'O';
//   //       _isPlayer1Turn = !_isPlayer1Turn;
//   //       if (_checkWin(row, col)) {
//   //         _isGameOver = true;
//   //       } else if (_checkDraw()) {
//   //         _isGameOver = true;
//   //       } else if (!_isPlayer1Turn) {
//   //         _aiMove();
//   //       }
//   //     });
//   //   }
//   // }
//   void _onTapTile(int row, int col) {
//     if (!_isGameOver && _board[row][col] == '') {
//       setState(() {
//         _board[row][col] = _isPlayer1Turn ? 'X' : 'O';
//         _isPlayer1Turn = !_isPlayer1Turn;
//         if (_checkWin(row, col)) {
//           _isGameOver = true;
//         } else if (_checkDraw()) {
//           _isGameOver = true;
//         } else if (!_isPlayer1Turn) {
//           // Introduce a delay before AI move
//           Future.delayed(Duration(milliseconds: 500), () {
//             _aiMove();
//           });
//         }
//
//       });
//     }
//   }
//
//   bool _checkWin(int row, int col) {
//     int rowN = row;
//     String player = _board[row][col];
//     // Check row
//     if (_board[row].every((cell) => cell == player)) return true;
//     // Check column
//     if (_board.every((row) => row[col] == player)) return true;
//     // Check diagonal
//     if (row == col) {
//       bool DiagonalWin = true;
//       for (int i = 0; i < 3; i++) {
//         if (_board[i][i] != player) {
//           DiagonalWin = false;
//           break;
//         }
//       }
//       if (DiagonalWin) return true;
//     }
//     // Check anti-diagonal
//     if (row + col == 2) {
//       bool antiDiagonalWin = true;
//       for (int i = 0; i < 3; i++) {
//         if (_board[i][2 - i] != player) {
//           antiDiagonalWin = false;
//           break;
//         }
//       }
//       if (antiDiagonalWin) return true;
//     }
//     return false;
//   }
//
//   bool _checkDraw() {
//     return _board.every((row) => row.every((cell) => cell != ''));
//   }
//
//   void _aiMove() {
//     // Check for potential winning moves for AI
//     for (int i = 0; i < 3; i++) {
//       for (int j = 0; j < 3; j++) {
//         if (_board[i][j] == '') {
//           _board[i][j] = 'O'; // Assume AI's move
//           if (_checkWin(i, j)) {
//             _onTapTile(i, j);
//             return;
//           }
//           _board[i][j] = ''; // Reset for next check
//         }
//       }
//     }
//
//     // Check for potential winning moves for player and block them
//     for (int i = 0; i < 3; i++) {
//       for (int j = 0; j < 3; j++) {
//         if (_board[i][j] == '') {
//           _board[i][j] = 'X'; // Assume player's move
//           if (_checkWin(i, j)) {
//             _board[i][j] = 'O'; // Block the player
//             _onTapTile(i, j);
//             return;
//           } else {
//             _board[i][j] = ''; // Reset for next check
//           }
//         }
//       }
//     }
//
//     // If no potential winning moves, make a random move
//     List<int> emptyCells = [];
//     for (int i = 0; i < 3; i++) {
//       for (int j = 0; j < 3; j++) {
//         if (_board[i][j] == '') {
//           emptyCells.add(i * 3 + j);
//         }
//       }
//     }
//     if (emptyCells.isNotEmpty) {
//       int randomIndex = Random().nextInt(emptyCells.length);
//       int index = emptyCells[randomIndex];
//       int row = index ~/ 3;
//       int col = index % 3;
//       _onTapTile(row, col);
//     }
//   }
//
//
//
//
//
// }


import 'package:flutter/material.dart';
import 'screens/menu_screen.dart';

void main() {
  runApp(TicTacToeApp());
}

class TicTacToeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MenuScreen(),
    );
  }
}

