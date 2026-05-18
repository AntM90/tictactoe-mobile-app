import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe_mobile_app/features/game/domain/entities/board.dart';
import 'package:tictactoe_mobile_app/features/game/domain/entities/game.dart';
import 'package:tictactoe_mobile_app/features/game/domain/entities/player.dart';
import 'package:tictactoe_mobile_app/features/game/domain/services/game_service_impl.dart';

void main() {
  late GameServiceImpl gameService;

  setUp(() {
    gameService = GameServiceImpl();
  });

  group('checkIfPlayerWon', () {
    test('returns true when player has a winning row combo', () {
      final player = Player.x(name: 'Alice').copyWith(combos: [0, 1, 2]);
      final board = Board.empty();

      expect(gameService.checkIfPlayerWon(board, player), isTrue);
    });

    test('returns true when player has a winning diagonal combo', () {
      final player = Player.x(name: 'Alice').copyWith(combos: [0, 4, 8]);
      final board = Board.empty();

      expect(gameService.checkIfPlayerWon(board, player), isTrue);
    });

    test('returns false when player has no winning combo', () {
      final player = Player.x(name: 'Alice').copyWith(combos: [0, 1, 5]);
      final board = Board.empty();

      expect(gameService.checkIfPlayerWon(board, player), isFalse);
    });
  });

  group('checkIfBoardIsFull', () {
    test('returns false when board is empty', () {
      expect(gameService.checkIfBoardIsFull(Board.empty()), isFalse);
    });

    test('returns true when board is full', () {
      final board = Board(cells: List.filled(9, PlayerSymbol.x));

      expect(gameService.checkIfBoardIsFull(board), isTrue);
    });
  });

  group('isValidMove', () {
    test('returns true when cell is empty', () {
      expect(gameService.isValidMove(Board.empty(), 0), isTrue);
    });

    test('returns false when cell is already taken', () {
      final cells = List<PlayerSymbol?>.filled(9, null);
      cells[0] = PlayerSymbol.x;
      final board = Board(cells: cells);

      expect(gameService.isValidMove(board, 0), isFalse);
    });

    test('returns false when index is out of bounds', () {
      final board = Board.empty();

      expect(gameService.isValidMove(board, -1), isFalse);
      expect(gameService.isValidMove(board, 9), isFalse);
    });
  });

  group('applyMove', () {
    test('places the symbol at the given index', () {
      final result = gameService.applyMove(Board.empty(), 4, PlayerSymbol.x);

      expect(result.cells[4], PlayerSymbol.x);
    });

    test('does not mutate the original board', () {
      final board = Board.empty();

      gameService.applyMove(board, 4, PlayerSymbol.x);

      expect(board.cells[4], isNull);
    });
  });

  group('addMoveToPlayer', () {
    test('adds the move to player combos', () {
      final player = Player.x(name: 'Alice');

      final result = gameService.addMoveToPlayer(player, 4);

      expect(result.combos, [4]);
    });

    test('does not mutate the original player', () {
      final player = Player.x(name: 'Alice');

      gameService.addMoveToPlayer(player, 4);

      expect(player.combos, isEmpty);
    });
  });

  group('getNextPlayer', () {
    test('returns playerO when currentPlayer is playerX', () {
      final playerX = Player.x(name: 'Alice');
      final playerO = Player.o(name: 'Bob');
      final game = Game(
        board: Board.empty(),
        playerX: playerX,
        playerO: playerO,
        currentPlayer: playerX,
      );

      expect(gameService.getNextPlayer(game), playerO);
    });

    test('returns playerX when currentPlayer is playerO', () {
      final playerX = Player.x(name: 'Alice');
      final playerO = Player.o(name: 'Bob');
      final game = Game(
        board: Board.empty(),
        playerX: playerX,
        playerO: playerO,
        currentPlayer: playerO,
      );

      expect(gameService.getNextPlayer(game), playerX);
    });
  });
}
