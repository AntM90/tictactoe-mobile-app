import 'package:freezed_annotation/freezed_annotation.dart';

part 'player.freezed.dart';
part 'player.g.dart';

enum PlayerSymbol { x, o }

@freezed
class Player with _$Player {
  const Player._();

  const factory Player({
    required String name,
    required PlayerSymbol symbol,
    @Default(0) int score,
    @Default([]) List<int> combos,
  }) = _Player;

  factory Player.x({required String name}) =>
      Player(name: name, symbol: PlayerSymbol.x);

  factory Player.o({required String name}) =>
      Player(name: name, symbol: PlayerSymbol.o);

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}
