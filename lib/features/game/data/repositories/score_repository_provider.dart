import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_mobile_app/features/game/data/datasources/score_local_datasource_provider.dart';
import 'package:tictactoe_mobile_app/features/game/data/repositories/score_repository_impl.dart';
import 'package:tictactoe_mobile_app/features/game/domain/repositories/score_repository.dart';

final scoreRepositoryProvider = Provider<ScoreRepository>((ref) {
  return ScoreRepositoryImpl(ref.watch(scoreLocalDatasourceProvider));
});
