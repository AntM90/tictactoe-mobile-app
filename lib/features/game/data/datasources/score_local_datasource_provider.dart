import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_mobile_app/core/providers/shared_preferences_provider.dart';
import 'package:tictactoe_mobile_app/features/game/data/datasources/score_local_datasource.dart';
import 'package:tictactoe_mobile_app/features/game/data/datasources/score_local_datasource_impl.dart';

final scoreLocalDatasourceProvider = Provider<ScoreLocalDatasource>((ref) {
  return ScoreLocalDatasourceImpl(ref.watch(sharedPreferencesProvider));
});
