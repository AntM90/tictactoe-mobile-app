abstract class ScoreLocalDatasource {
  Future<Map<String, int>> loadScores();
  Future<void> saveScores(Map<String, int> scores);
  Future<void> resetScores();
}
