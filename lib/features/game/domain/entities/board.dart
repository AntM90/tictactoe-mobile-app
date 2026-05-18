import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe_mobile_app/features/game/domain/entities/player.dart';

part 'board.freezed.dart';
part 'board.g.dart';

@freezed
class Board with _$Board {
  const factory Board({
    required List<PlayerSymbol?> cells,
  }) = _Board;

  factory Board.empty() => Board(cells: List.filled(9, null));

  factory Board.fromJson(Map<String, dynamic> json) => _$BoardFromJson(json);
}
