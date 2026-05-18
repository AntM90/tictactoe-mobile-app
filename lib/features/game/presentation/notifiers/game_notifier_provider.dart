import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_mobile_app/features/game/presentation/notifiers/game_notifier.dart';
import 'package:tictactoe_mobile_app/features/game/presentation/states/game_state.dart';

final gameNotifierProvider = NotifierProvider<GameNotifier, GameState>(GameNotifier.new);