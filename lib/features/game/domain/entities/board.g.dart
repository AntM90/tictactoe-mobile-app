// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BoardImpl _$$BoardImplFromJson(Map<String, dynamic> json) => _$BoardImpl(
      cells: (json['cells'] as List<dynamic>)
          .map((e) => $enumDecodeNullable(_$PlayerSymbolEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$BoardImplToJson(_$BoardImpl instance) =>
    <String, dynamic>{
      'cells': instance.cells.map((e) => _$PlayerSymbolEnumMap[e]).toList(),
    };

const _$PlayerSymbolEnumMap = {
  PlayerSymbol.x: 'x',
  PlayerSymbol.o: 'o',
};
