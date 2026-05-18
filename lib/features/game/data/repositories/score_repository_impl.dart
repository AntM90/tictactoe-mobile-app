import 'package:tictactoe_mobile_app/features/game/data/datasources/score_local_datasource.dart';
import 'package:tictactoe_mobile_app/features/game/domain/entities/player.dart';
import 'package:tictactoe_mobile_app/features/game/domain/repositories/score_repository.dart';

class ScoreRepositoryImpl implements ScoreRepository {
  final ScoreLocalDatasource _localDatasource;

  ScoreRepositoryImpl(this._localDatasource);

  @override
  Future<Map<PlayerSymbol, int>> loadScores() async {
    final raw = await _localDatasource.loadScores();
    final result = <PlayerSymbol, int>{};

    for (final entry in raw.entries) {
      final symbol = _symbolFromString(entry.key);
      if (symbol != null) {
        result[symbol] = entry.value;
      }
    }

    return result;
  }

  @override
  Future<void> saveScores(Map<PlayerSymbol, int> scores) {
    final mapped = scores.map((key, value) => MapEntry(key.name, value));
    return _localDatasource.saveScores(mapped);
  }

  @override
  Future<void> resetScores() {
    return _localDatasource.resetScores();
  }

  PlayerSymbol? _symbolFromString(String value) {
    return PlayerSymbol.values
        .where((symbol) => symbol.name == value)
        .firstOrNull;
  }
}
