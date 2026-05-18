import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_mobile_app/core/theme/app_spacing.dart';
import 'package:tictactoe_mobile_app/features/game/presentation/notifiers/game_notifier_provider.dart';
import 'package:tictactoe_mobile_app/features/game/presentation/notifiers/score_notifier_provider.dart';
import 'package:tictactoe_mobile_app/features/game/presentation/widgets/board_widget.dart';
import 'package:tictactoe_mobile_app/features/game/presentation/widgets/grid_background.dart';
import 'package:tictactoe_mobile_app/features/game/presentation/widgets/replay_button.dart';
import 'package:tictactoe_mobile_app/features/game/presentation/widgets/score_widget.dart';
import 'package:tictactoe_mobile_app/features/game/presentation/widgets/status_widget.dart';

class GamePage extends ConsumerWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('TicTacToe'),
        actions: [
          IconButton(
            icon: const Icon(Icons.restart_alt),
            tooltip: 'Réinitialiser les scores',
            onPressed: () => _confirmResetScores(context, ref),
          ),
        ],
      ),
      body: GridBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              children: [
                const ScoreWidget(),
                const SizedBox(height: AppSpacing.lg),
                StatusWidget(state: gameState),
                const SizedBox(height: AppSpacing.lg),
                BoardWidget(board: gameState.game.board),
                const Spacer(),
                ReplayButton(
                  onPressed: () =>
                      ref.read(gameNotifierProvider.notifier).resetGame(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _confirmResetScores(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Réinitialiser les scores'),
        content: const Text('Êtes-vous sûr ? Cette action est irréversible.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Réinitialiser'),
          ),
        ],
      ),
    );

    if (confirmed ?? false) {
      ref.read(scoreNotifierProvider.notifier).resetScores();
    }
  }
}
