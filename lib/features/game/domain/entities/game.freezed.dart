// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Game _$GameFromJson(Map<String, dynamic> json) {
  return _Game.fromJson(json);
}

/// @nodoc
mixin _$Game {
  Board get board => throw _privateConstructorUsedError;
  Player get playerX => throw _privateConstructorUsedError;
  Player get playerO => throw _privateConstructorUsedError;
  Player get currentPlayer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameCopyWith<Game> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameCopyWith<$Res> {
  factory $GameCopyWith(Game value, $Res Function(Game) then) =
      _$GameCopyWithImpl<$Res, Game>;
  @useResult
  $Res call(
      {Board board, Player playerX, Player playerO, Player currentPlayer});

  $BoardCopyWith<$Res> get board;
  $PlayerCopyWith<$Res> get playerX;
  $PlayerCopyWith<$Res> get playerO;
  $PlayerCopyWith<$Res> get currentPlayer;
}

/// @nodoc
class _$GameCopyWithImpl<$Res, $Val extends Game>
    implements $GameCopyWith<$Res> {
  _$GameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? board = null,
    Object? playerX = null,
    Object? playerO = null,
    Object? currentPlayer = null,
  }) {
    return _then(_value.copyWith(
      board: null == board
          ? _value.board
          : board // ignore: cast_nullable_to_non_nullable
              as Board,
      playerX: null == playerX
          ? _value.playerX
          : playerX // ignore: cast_nullable_to_non_nullable
              as Player,
      playerO: null == playerO
          ? _value.playerO
          : playerO // ignore: cast_nullable_to_non_nullable
              as Player,
      currentPlayer: null == currentPlayer
          ? _value.currentPlayer
          : currentPlayer // ignore: cast_nullable_to_non_nullable
              as Player,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BoardCopyWith<$Res> get board {
    return $BoardCopyWith<$Res>(_value.board, (value) {
      return _then(_value.copyWith(board: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PlayerCopyWith<$Res> get playerX {
    return $PlayerCopyWith<$Res>(_value.playerX, (value) {
      return _then(_value.copyWith(playerX: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PlayerCopyWith<$Res> get playerO {
    return $PlayerCopyWith<$Res>(_value.playerO, (value) {
      return _then(_value.copyWith(playerO: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PlayerCopyWith<$Res> get currentPlayer {
    return $PlayerCopyWith<$Res>(_value.currentPlayer, (value) {
      return _then(_value.copyWith(currentPlayer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GameImplCopyWith<$Res> implements $GameCopyWith<$Res> {
  factory _$$GameImplCopyWith(
          _$GameImpl value, $Res Function(_$GameImpl) then) =
      __$$GameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Board board, Player playerX, Player playerO, Player currentPlayer});

  @override
  $BoardCopyWith<$Res> get board;
  @override
  $PlayerCopyWith<$Res> get playerX;
  @override
  $PlayerCopyWith<$Res> get playerO;
  @override
  $PlayerCopyWith<$Res> get currentPlayer;
}

/// @nodoc
class __$$GameImplCopyWithImpl<$Res>
    extends _$GameCopyWithImpl<$Res, _$GameImpl>
    implements _$$GameImplCopyWith<$Res> {
  __$$GameImplCopyWithImpl(_$GameImpl _value, $Res Function(_$GameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? board = null,
    Object? playerX = null,
    Object? playerO = null,
    Object? currentPlayer = null,
  }) {
    return _then(_$GameImpl(
      board: null == board
          ? _value.board
          : board // ignore: cast_nullable_to_non_nullable
              as Board,
      playerX: null == playerX
          ? _value.playerX
          : playerX // ignore: cast_nullable_to_non_nullable
              as Player,
      playerO: null == playerO
          ? _value.playerO
          : playerO // ignore: cast_nullable_to_non_nullable
              as Player,
      currentPlayer: null == currentPlayer
          ? _value.currentPlayer
          : currentPlayer // ignore: cast_nullable_to_non_nullable
              as Player,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameImpl implements _Game {
  const _$GameImpl(
      {required this.board,
      required this.playerX,
      required this.playerO,
      required this.currentPlayer});

  factory _$GameImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameImplFromJson(json);

  @override
  final Board board;
  @override
  final Player playerX;
  @override
  final Player playerO;
  @override
  final Player currentPlayer;

  @override
  String toString() {
    return 'Game(board: $board, playerX: $playerX, playerO: $playerO, currentPlayer: $currentPlayer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameImpl &&
            (identical(other.board, board) || other.board == board) &&
            (identical(other.playerX, playerX) || other.playerX == playerX) &&
            (identical(other.playerO, playerO) || other.playerO == playerO) &&
            (identical(other.currentPlayer, currentPlayer) ||
                other.currentPlayer == currentPlayer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, board, playerX, playerO, currentPlayer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameImplCopyWith<_$GameImpl> get copyWith =>
      __$$GameImplCopyWithImpl<_$GameImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameImplToJson(
      this,
    );
  }
}

abstract class _Game implements Game {
  const factory _Game(
      {required final Board board,
      required final Player playerX,
      required final Player playerO,
      required final Player currentPlayer}) = _$GameImpl;

  factory _Game.fromJson(Map<String, dynamic> json) = _$GameImpl.fromJson;

  @override
  Board get board;
  @override
  Player get playerX;
  @override
  Player get playerO;
  @override
  Player get currentPlayer;
  @override
  @JsonKey(ignore: true)
  _$$GameImplCopyWith<_$GameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
