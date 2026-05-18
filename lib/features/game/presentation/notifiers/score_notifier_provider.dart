import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_mobile_app/features/game/domain/entities/player.dart';
import 'package:tictactoe_mobile_app/features/game/presentation/notifiers/score_notifier.dart';

final scoreNotifierProvider =
    AsyncNotifierProvider<ScoreNotifier, Map<PlayerSymbol, int>>(ScoreNotifier.new);
