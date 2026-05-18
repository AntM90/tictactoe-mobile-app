import 'package:tictactoe_mobile_app/features/game/domain/entities/board.dart';
import 'package:tictactoe_mobile_app/features/game/domain/entities/game.dart';
import 'package:tictactoe_mobile_app/features/game/domain/entities/player.dart';

abstract class GameService {
  bool checkIfPlayerWon(Board board, Player player);
  bool checkIfBoardIsFull(Board board);
  bool isValidMove(Board board, int index);
  Board applyMove(Board board, int index, PlayerSymbol symbol);
  Player addMoveToPlayer(Player player, int index);
  Player getNextPlayer(Game game);
}
