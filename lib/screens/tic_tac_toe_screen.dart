import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/screens/login_screen.dart';
import 'package:tic_tac_toe_game/widgets/board_button.dart';

class GameBoardScreen extends StatefulWidget {
  const GameBoardScreen({super.key});

  static const String routeName = '/GameBordScreen';

  @override
  State<GameBoardScreen> createState() => _GameBoardScreenState();
}

class _GameBoardScreenState extends State<GameBoardScreen> {
  List<String> board = List.filled(9, '');
  int player1Score = 0;
  int player2Score = 0;

  @override
  Widget build(BuildContext context) {
    GameBoardArgs args =
        ModalRoute.of(context)!.settings.arguments as GameBoardArgs;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          '${args.player1Name}: (X)',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          player1Score.toString(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '${args.player2Name}: (O)',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          player2Score.toString(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: board.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    mainAxisExtent: MediaQuery.sizeOf(context).height * 0.255),
                itemBuilder: (_, index) {
                  return BoardButton(
                    index: index,
                    text: board[index],
                    onPressed: onButtonClicked,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  int round = 1;

  void onButtonClicked(int index) {
    print(round);
    if (board[index].isNotEmpty) return;
    if (round.isOdd) {
      board[index] = 'X';
      if (checkWinner('X')) {
        player1Score++;
        clearBoard();
        return;
      }
    } else {
      board[index] = 'O';
      if (checkWinner('O')) {
        player2Score++;
        clearBoard();
        return;
      }
    }
    round++;
    if (round == 10) {
      clearBoard();
      return;
    }
    setState(() {});
  }

  bool checkWinner(String symbol) {
    if (round < 5) return false;
    // check diagonals
    if (board[0] == symbol && board[4] == symbol && board[8] == symbol) {
      return true;
    }
    if (board[2] == symbol && board[4] == symbol && board[6] == symbol) {
      return true;
    }
    // 0  1  2
    // 3  4  5
    // 6  7  8
    // check rows
    for (int i = 0; i <= 6; i += 3) {
      if (board[i] == symbol &&
          board[i + 1] == symbol &&
          board[i + 2] == symbol) {
        return true;
      }
    }
    // check columns
    // 0 3 6
    // 1 4 7
    // 2 5 8
    for (int i = 0; i <= 2; i++) {
      if (board[i] == symbol &&
          board[i + 3] == symbol &&
          board[i + 6] == symbol) {
        return true;
      }
    }
    return false;
  }

  void clearBoard() {
    board = List.filled(9, '');
    round = 1;
    setState(() {});
  }
}
