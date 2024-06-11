import 'package:flutter/material.dart';
import 'package:game/components/tic_tac_toe_board.dart';

class GameScreen extends StatelessWidget {
  final bool isVsAI;

  GameScreen({required this.isVsAI});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe Game'),
      ),
      body: Center(
        child: Container(
          width: screenWidth, // Set the desired width of the board
          height: screenWidth, // Set the desired height of the board
          child: TicTacToeBoard(isVsAI: isVsAI),
        ),
      ),
    );
  }
}
