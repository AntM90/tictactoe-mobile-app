import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_mobile_app/core/theme/app_colors.dart';
import 'package:tictactoe_mobile_app/core/theme/app_radius.dart';
import 'package:tictactoe_mobile_app/core/theme/app_spacing.dart';
import 'package:tictactoe_mobile_app/features/game/domain/entities/board.dart';
import 'package:tictactoe_mobile_app/features/game/domain/entities/player.dart';
import 'package:tictactoe_mobile_app/features/game/presentation/notifiers/game_notifier_provider.dart';

class BoardWidget extends ConsumerWidget {
  final Board board;

  const BoardWidget({required this.board, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(color: AppColors.border),
        ),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: AppSpacing.sm,
            crossAxisSpacing: AppSpacing.sm,
          ),
          itemCount: 9,
          itemBuilder: (context, index) {
            return _BoardCell(
              symbol: board.cells[index],
              onTap: () =>
                  ref.read(gameNotifierProvider.notifier).makeMove(index),
            );
          },
        ),
      ),
    );
  }
}

class _BoardCell extends StatefulWidget {
  final PlayerSymbol? symbol;
  final VoidCallback onTap;

  const _BoardCell({required this.symbol, required this.onTap});

  @override
  State<_BoardCell> createState() => _BoardCellState();
}

class _BoardCellState extends State<_BoardCell> {
  bool _isPressed = false;

  bool get _isEmpty => widget.symbol == null;

  void _handleTapDown(TapDownDetails _) {
    if (!_isEmpty) return;
    setState(() => _isPressed = true);
  }

  void _handleTapUp(TapUpDetails _) {
    setState(() => _isPressed = false);
  }

  void _handleTapCancel() {
    setState(() => _isPressed = false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: AnimatedScale(
        scale: _isPressed ? 0.92 : 1,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          decoration: BoxDecoration(
            color: _isPressed ? AppColors.surface : AppColors.surfaceVariant,
            borderRadius: BorderRadius.circular(AppRadius.md),
            border: Border.all(color: AppColors.borderSubtle),
          ),
          child: Center(child: _buildSymbol()),
        ),
      ),
    );
  }

  Widget _buildSymbol() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      transitionBuilder: (child, animation) {
        return ScaleTransition(
          scale: animation,
          child: FadeTransition(opacity: animation, child: child),
        );
      },
      child: switch (widget.symbol) {
        PlayerSymbol.x => const _XSymbol(key: ValueKey('x')),
        PlayerSymbol.o => const _OSymbol(key: ValueKey('o')),
        null => const SizedBox.shrink(key: ValueKey('empty')),
      },
    );
  }
}

class _XSymbol extends StatelessWidget {
  const _XSymbol({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'X',
      style: TextStyle(
        fontSize: 56,
        fontWeight: FontWeight.w900,
        color: AppColors.playerX,
        height: 1,
        shadows: [
          Shadow(color: AppColors.playerX, blurRadius: 24),
        ],
      ),
    );
  }
}

class _OSymbol extends StatelessWidget {
  const _OSymbol({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.playerO, width: 5),
        boxShadow: [
          BoxShadow(
            color: AppColors.playerO.withOpacity(0.5),
            blurRadius: 18,
            spreadRadius: 1,
          ),
        ],
      ),
    );
  }
}
