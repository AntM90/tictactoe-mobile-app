import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe_mobile_app/features/game/domain/entities/board.dart';
import 'package:tictactoe_mobile_app/features/game/domain/entities/game.dart';
import 'package:tictactoe_mobile_app/features/game/domain/entities/player.dart';
import 'package:tictactoe_mobile_app/features/game/domain/services/game_service.dart';
import 'package:tictactoe_mobile_app/features/game/domain/services/game_service_provider.dart';
import 'package:tictactoe_mobile_app/features/game/presentation/notifiers/score_notifier_provider.dart';
import 'package:tictactoe_mobile_app/features/game/presentation/states/game_state.dart';

class GameNotifier extends Notifier<GameState> {
  late final GameService _gameService;

  @override
  GameState build() {
    _gameService = ref.watch(gameServiceProvider);
    return _initialState();
  }

  void makeMove(int index) {
    if (state.status != GameStatus.playing) return;
    if (!_gameService.isValidMove(state.game.board, index)) return;

    final game = state.game;
    final currentPlayer = game.currentPlayer;

    final updatedBoard = _gameService.applyMove(
      game.board,
      index,
      currentPlayer.symbol,
    );
    final updatedPlayer = _gameService.addMoveToPlayer(currentPlayer, index);

    final updatedGame = _updatePlayerInGame(game, updatedPlayer).copyWith(
      board: updatedBoard,
      currentPlayer: updatedPlayer,
    );

    if (_gameService.checkIfPlayerWon(updatedBoard, updatedPlayer)) {
      ref.read(scoreNotifierProvider.notifier).incrementScore(
            updatedPlayer.symbol,
          );
      state = state.copyWith(
        game: updatedGame,
        status: GameStatus.won,
        winner: updatedPlayer,
      );
      return;
    }

    if (_gameService.checkIfBoardIsFull(updatedBoard)) {
      state = state.copyWith(game: updatedGame, status: GameStatus.draw);
      return;
    }

    final nextPlayer = _gameService.getNextPlayer(updatedGame);
    state = state.copyWith(
      game: updatedGame.copyWith(currentPlayer: nextPlayer),
    );
  }

  void resetGame() {
    state = _initialState();
  }

  Game _updatePlayerInGame(Game game, Player updatedPlayer) {
    return updatedPlayer.symbol == PlayerSymbol.x
        ? game.copyWith(playerX: updatedPlayer)
        : game.copyWith(playerO: updatedPlayer);
  }

  GameState _initialState() {
    final playerX = Player.x(name: 'Joueur 1');
    final playerO = Player.o(name: 'Joueur 2');

    return GameState(
      game: Game(
        board: Board.empty(),
        playerX: playerX,
        playerO: playerO,
        currentPlayer: playerX,
      ),
    );
  }
}
