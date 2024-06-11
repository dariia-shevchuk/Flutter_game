import 'package:flutter/material.dart';
import 'game_screen.dart';
import 'statistics_screen.dart';
import 'ai_difficulty_screen.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 350, // Set the desired width
              height: 60, // Set the desired height
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameScreen(isVsAI: true),
                    ),
                  );
                },
                child: Text('Play vs AI', style: TextStyle(fontSize: 20)), // Set font size
              ),
            ),
            SizedBox(height: 20), // Add some space between buttons
            SizedBox(
              width: 350,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameScreen(isVsAI: false),
                    ),
                  );
                },
                child: Text('Play vs Person', style: TextStyle(fontSize: 20)),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 350,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StatisticsScreen(),
                    ),
                  );
                },
                child: Text('View Statistics', style: TextStyle(fontSize: 20)),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 350,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AIDifficultyScreen(),
                    ),
                  );
                },
                child: Text('Change AI Difficulty', style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
