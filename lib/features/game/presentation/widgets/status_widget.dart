import 'package:flutter/material.dart';
import 'package:tictactoe_mobile_app/features/game/presentation/states/game_state.dart';

class StatusWidget extends StatelessWidget {
  final GameState state;

  const StatusWidget({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      _statusText(),
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  String _statusText() {
    return switch (state.status) {
      GameStatus.playing => 'Au tour de ${state.game.currentPlayer.name}',
      GameStatus.won => '${state.winner?.name ?? ''} a gagné !',
      GameStatus.draw => 'Match nul !',
    };
  }
}
