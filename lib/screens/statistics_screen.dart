import 'package:flutter/material.dart';
import 'package:game/services/statistics.dart';

class StatisticsScreen extends StatefulWidget {
  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  int gamesPlayed = 0;
  int gamesWon = 0;
  double winPercentage = 0.0;

  @override
  void initState() {
    super.initState();
    _loadStatistics();
  }

  void _loadStatistics() async {
    Statistics stats = Statistics();
    int played = await stats.getGamesPlayed();
    int won = await stats.getGamesWon();
    double percentage = await stats.getWinPercentage();

    setState(() {
      gamesPlayed = played;
      gamesWon = won;
      winPercentage = percentage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistics'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Games Played: $gamesPlayed', style: TextStyle(fontSize: 20)),
            Text('Games Won: $gamesWon', style: TextStyle(fontSize: 20)),
            Text('Win Percentage: ${winPercentage.toStringAsFixed(2)}%', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
