import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe_mobile_app/features/game/domain/entities/game.dart';
import 'package:tictactoe_mobile_app/features/game/domain/entities/player.dart';

part 'game_state.freezed.dart';

enum GameStatus { playing, won, draw }

@freezed
class GameState with _$GameState {
  const factory GameState({
    required Game game,
    @Default(GameStatus.playing) GameStatus status,
    Player? winner,
  }) = _GameState;
}
