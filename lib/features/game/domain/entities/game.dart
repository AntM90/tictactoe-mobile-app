import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe_mobile_app/features/game/domain/entities/board.dart';
import 'package:tictactoe_mobile_app/features/game/domain/entities/player.dart';

part 'game.freezed.dart';
part 'game.g.dart';

@freezed
class Game with _$Game {
  const factory Game({
    required Board board,
    required Player playerX,
    required Player playerO,
    required Player currentPlayer,
  }) = _Game;

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
}
