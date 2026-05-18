import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tictactoe_mobile_app/features/game/data/datasources/score_local_datasource.dart';

class ScoreLocalDatasourceImpl implements ScoreLocalDatasource {
  static const _scoresKey = 'tictactoe_scores';

  final SharedPreferences _prefs;

  ScoreLocalDatasourceImpl(this._prefs);

  @override
  Future<Map<String, int>> loadScores() async {
    final raw = _prefs.getString(_scoresKey);
    if (raw == null) return {};

    final decoded = jsonDecode(raw) as Map<String, dynamic>;
    return decoded.map((key, value) => MapEntry(key, value as int));
  }

  @override
  Future<void> saveScores(Map<String, int> scores) async {
    await _prefs.setString(_scoresKey, jsonEncode(scores));
  }

  @override
  Future<void> resetScores() async {
    await _prefs.remove(_scoresKey);
  }
}
