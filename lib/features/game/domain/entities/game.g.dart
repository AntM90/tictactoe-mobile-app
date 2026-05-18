// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameImpl _$$GameImplFromJson(Map<String, dynamic> json) => _$GameImpl(
      board: Board.fromJson(json['board'] as Map<String, dynamic>),
      playerX: Player.fromJson(json['playerX'] as Map<String, dynamic>),
      playerO: Player.fromJson(json['playerO'] as Map<String, dynamic>),
      currentPlayer:
          Player.fromJson(json['currentPlayer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GameImplToJson(_$GameImpl instance) =>
    <String, dynamic>{
      'board': instance.board,
      'playerX': instance.playerX,
      'playerO': instance.playerO,
      'currentPlayer': instance.currentPlayer,
    };
