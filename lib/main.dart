import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/screens/login_screen.dart';
import 'package:tic_tac_toe_game/screens/tic_tac_toe_screen.dart';

void main() {
  runApp(const TicTacToeGame());
}

class TicTacToeGame extends StatelessWidget {
  const TicTacToeGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.routeName: (context) => const LoginScreen(),
        GameBoardScreen.routeName: (context) => const GameBoardScreen(),
      },
      initialRoute: LoginScreen.routeName,
    );
  }
}
