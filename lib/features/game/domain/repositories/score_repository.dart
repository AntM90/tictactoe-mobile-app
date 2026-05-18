import 'package:tictactoe_mobile_app/features/game/domain/entities/player.dart';

abstract class ScoreRepository {
  Future<Map<PlayerSymbol, int>> loadScores();
  Future<void> saveScores(Map<PlayerSymbol, int> scores);
  Future<void> resetScores();
}
