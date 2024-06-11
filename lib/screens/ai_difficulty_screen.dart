import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AIDifficultyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change AI Difficulty'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 350, // Set the desired width
              height: 60,  // Set the desired height
              child: ElevatedButton(
                onPressed: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.setString('aiDifficulty', 'low');
                  Navigator.pop(context);
                },
                child: Text('Low Level AI', style: TextStyle(fontSize: 20)),
              ),
            ),
            SizedBox(height: 20), // Add spacing between buttons
            SizedBox(
              width: 350, // Set the desired width
              height: 60,  // Set the desired height
              child: ElevatedButton(
                onPressed: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.setString('aiDifficulty', 'high');
                  Navigator.pop(context);
                },
                child: Text('High Level AI', style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
