import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_mobile_app/features/game/domain/entities/player.dart';
import 'package:tictactoe_mobile_app/features/game/domain/repositories/score_repository.dart';
import 'package:tictactoe_mobile_app/features/game/data/repositories/score_repository_provider.dart';

class ScoreNotifier extends AsyncNotifier<Map<PlayerSymbol, int>> {
  late final ScoreRepository _repository;

  @override
  Future<Map<PlayerSymbol, int>> build() async {
    _repository = ref.watch(scoreRepositoryProvider);
    return _repository.loadScores();
  }

  Future<void> incrementScore(PlayerSymbol symbol) async {
    final current = state.valueOrNull ?? {};
    final updated = {...current};
    updated[symbol] = (updated[symbol] ?? 0) + 1;

    await _repository.saveScores(updated);
    state = AsyncData(updated);
  }

  Future<void> resetScores() async {
    await _repository.resetScores();
    state = const AsyncData({});
  }
}
