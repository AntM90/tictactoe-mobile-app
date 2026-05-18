import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_mobile_app/features/game/domain/services/game_service.dart';
import 'package:tictactoe_mobile_app/features/game/domain/services/game_service_impl.dart';

final gameServiceProvider = Provider<GameService>((ref) {
  return GameServiceImpl();
});
