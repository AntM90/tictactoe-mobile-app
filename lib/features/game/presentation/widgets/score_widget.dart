import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_mobile_app/core/theme/app_colors.dart';
import 'package:tictactoe_mobile_app/core/theme/app_radius.dart';
import 'package:tictactoe_mobile_app/core/theme/app_spacing.dart';
import 'package:tictactoe_mobile_app/core/theme/app_text_styles.dart';
import 'package:tictactoe_mobile_app/features/game/domain/entities/player.dart';
import 'package:tictactoe_mobile_app/features/game/presentation/notifiers/game_notifier_provider.dart';
import 'package:tictactoe_mobile_app/features/game/presentation/notifiers/score_notifier_provider.dart';
import 'package:tictactoe_mobile_app/features/game/presentation/states/game_state.dart';

enum _CardState { idle, active, winner, loser }

class ScoreWidget extends ConsumerWidget {
  const ScoreWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scoresAsync = ref.watch(scoreNotifierProvider);
    final gameState = ref.watch(gameNotifierProvider);

    return scoresAsync.when(
      data: (scores) {
        final xScore = scores[PlayerSymbol.x] ?? 0;
        final oScore = scores[PlayerSymbol.o] ?? 0;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: _ScoreCard(
                label: gameState.game.playerX.name,
                score: xScore,
                accentColor: AppColors.playerX,
                cardState: _stateFor(PlayerSymbol.x, gameState),
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: _ScoreCard(
                label: gameState.game.playerO.name,
                score: oScore,
                accentColor: AppColors.playerO,
                cardState: _stateFor(PlayerSymbol.o, gameState),
              ),
            ),
          ],
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, _) => Text('Erreur: $error'),
    );
  }

  _CardState _stateFor(PlayerSymbol symbol, GameState state) {
    if (state.status == GameStatus.draw) return _CardState.idle;
    if (state.status == GameStatus.won) {
      return state.winner?.symbol == symbol
          ? _CardState.winner
          : _CardState.loser;
    }
    return state.game.currentPlayer.symbol == symbol
        ? _CardState.active
        : _CardState.idle;
  }
}

class _ScoreCard extends StatelessWidget {
  final String label;
  final int score;
  final Color accentColor;
  final _CardState cardState;

  const _ScoreCard({
    required this.label,
    required this.score,
    required this.accentColor,
    required this.cardState,
  });

  @override
  Widget build(BuildContext context) {
    final isAccented =
        cardState == _CardState.active || cardState == _CardState.winner;
    final isWinner = cardState == _CardState.winner;
    final isLoser = cardState == _CardState.loser;

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: isLoser ? 0.45 : 1,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.surfaceVariant,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(
            color: isAccented ? accentColor : AppColors.borderSubtle,
            width: 2,
          ),
          boxShadow: isAccented
              ? [
                  BoxShadow(
                    color: accentColor.withOpacity(isWinner ? 0.5 : 0.25),
                    blurRadius: isWinner ? 22 : 12,
                    spreadRadius: isWinner ? 2 : 0,
                  ),
                ]
              : null,
        ),
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(color: accentColor, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: AppSpacing.sm),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 350),
              transitionBuilder: (child, animation) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 0.4),
                    end: Offset.zero,
                  ).animate(animation),
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
              child: Text(
                '$score',
                key: ValueKey(score),
                style: AppTextStyles.score,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
