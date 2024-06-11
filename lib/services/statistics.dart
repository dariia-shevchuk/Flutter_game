import 'package:shared_preferences/shared_preferences.dart';

class Statistics {
  Future<int> getGamesPlayed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('gamesPlayed') ?? 0;
  }

  Future<int> getGamesWon() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('gamesWon') ?? 0;
  }

  Future<void> incrementGamesPlayed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int gamesPlayed = (prefs.getInt('gamesPlayed') ?? 0) + 1;
    await prefs.setInt('gamesPlayed', gamesPlayed);
  }

  Future<void> incrementGamesWon() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int gamesWon = (prefs.getInt('gamesWon') ?? 0) + 1;
    await prefs.setInt('gamesWon', gamesWon);
  }

  Future<double> getWinPercentage() async {
    int gamesPlayed = await getGamesPlayed();
    if (gamesPlayed == 0) return 0.0;
    int gamesWon = await getGamesWon();
    return (gamesWon / gamesPlayed) * 100;
  }
}
