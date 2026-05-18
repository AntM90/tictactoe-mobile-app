import 'package:tictactoe_mobile_app/features/game/domain/entities/board.dart';
import 'package:tictactoe_mobile_app/features/game/domain/entities/game.dart';
import 'package:tictactoe_mobile_app/features/game/domain/entities/player.dart';
import 'package:tictactoe_mobile_app/features/game/domain/services/game_service.dart';

class GameServiceImpl implements GameService {
  static const _winningCombos = <List<int>>[
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  @override
  bool checkIfPlayerWon(Board board, Player player) {
    return _winningCombos.any(
      (combo) => combo.every((pos) => player.combos.contains(pos)),
    );
  }

  @override
  bool checkIfBoardIsFull(Board board) {
    return board.cells.every((cell) => cell != null);
  }

  @override
  bool isValidMove(Board board, int index) {
    return index >= 0 &&
        index < board.cells.length &&
        board.cells[index] == null;
  }

  @override
  Board applyMove(Board board, int index, PlayerSymbol symbol) {
    final newCells = [...board.cells];
    newCells[index] = symbol;
    return board.copyWith(cells: newCells);
  }

  @override
  Player addMoveToPlayer(Player player, int index) {
    return player.copyWith(combos: [...player.combos, index]);
  }

  @override
  Player getNextPlayer(Game game) {
    return game.currentPlayer == game.playerX ? game.playerO : game.playerX;
  }
}
