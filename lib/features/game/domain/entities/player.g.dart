// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerImpl _$$PlayerImplFromJson(Map<String, dynamic> json) => _$PlayerImpl(
      name: json['name'] as String,
      symbol: $enumDecode(_$PlayerSymbolEnumMap, json['symbol']),
      score: (json['score'] as num?)?.toInt() ?? 0,
      combos: (json['combos'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PlayerImplToJson(_$PlayerImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'symbol': _$PlayerSymbolEnumMap[instance.symbol]!,
      'score': instance.score,
      'combos': instance.combos,
    };

const _$PlayerSymbolEnumMap = {
  PlayerSymbol.x: 'x',
  PlayerSymbol.o: 'o',
};
