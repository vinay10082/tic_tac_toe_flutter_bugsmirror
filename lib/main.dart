import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe_flutter_bugsmirror/constants/fonts.dart';

import 'constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic-Tac-Toe Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (c) => const HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: Center(
        child: Text("Tic-Tac-Toe Game", style: MainFont.white),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool yoursTurn = true;
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];
  List<int> matchedIndexes = [];

  String resultDeclaration = '';
  int filledBoxes = 0;
  bool win = false;
  bool lose = false;
  bool tie = false;

  void _tapped(int index) {
    setState(() {
      if (yoursTurn && displayXO[index] == '') {
        displayXO[index] = 'O';
        filledBoxes++;
      }
      yoursTurn = !yoursTurn;
    });
    _checkWinner();

    //time delay of one sec for the computer chance
    Timer(const Duration(milliseconds: 250), () {
      _computerTurn();
    });
  }

  void _computerTurn() {
    int randomNumber = Random.secure().nextInt(9);

    if (!yoursTurn && displayXO[randomNumber] == '') {
      setState(() {
        displayXO[randomNumber] = 'X';
        filledBoxes++;
        yoursTurn = !yoursTurn;
      });
    } else {
      _computerTurn();
    }
    _checkWinner();
  }

  void _checkWinner() {
    //check 1st row
    if (displayXO[0] == 'O' && displayXO[1] == 'O' && displayXO[2] == 'O') {
      setState(() {
        resultDeclaration = 'You Wins!';
        matchedIndexes.addAll([0, 1, 2]);
        win = true;
      });
    }
    //check 2nd row
    if (displayXO[3] == 'O' && displayXO[4] == 'O' && displayXO[5] == 'O') {
      setState(() {
        resultDeclaration = 'You Wins!';
        matchedIndexes.addAll([3, 4, 5]);
        win = true;
      });
    }
    //check 3rd row
    if (displayXO[6] == 'O' && displayXO[7] == 'O' && displayXO[8] == 'O') {
      setState(() {
        resultDeclaration = 'You Wins!';
        matchedIndexes.addAll([6, 7, 8]);
        win = true;
      });
    }
    //check 1st column
    if (displayXO[0] == 'O' && displayXO[3] == 'O' && displayXO[6] == 'O') {
      setState(() {
        resultDeclaration = 'You Wins!';
        matchedIndexes.addAll([0, 3, 6]);
        win = true;
      });
    }
    //check 2nd column
    if (displayXO[1] == 'O' && displayXO[4] == 'O' && displayXO[7] == 'O') {
      setState(() {
        resultDeclaration = 'You Wins!';
        matchedIndexes.addAll([1, 4, 7]);
        win = true;
      });
    }
    //check 3rd column
    if (displayXO[2] == 'O' && displayXO[5] == 'O' && displayXO[8] == 'O') {
      setState(() {
        resultDeclaration = 'You Wins!';
        matchedIndexes.addAll([2, 5, 8]);
        win = true;
      });
    }
    //check diagonal 1
    if (displayXO[0] == 'O' && displayXO[4] == 'O' && displayXO[8] == 'O') {
      setState(() {
        resultDeclaration = 'You Wins!';
        matchedIndexes.addAll([0, 4, 8]);
        win = true;
      });
    }
    //check diagonal 2
    if (displayXO[2] == 'O' && displayXO[4] == 'O' && displayXO[6] == 'O') {
      setState(() {
        resultDeclaration = 'You Wins!';
        matchedIndexes.addAll([2, 4, 6]);
        win = true;
      });
    }
    //check 1st row
    if (displayXO[0] == 'X' && displayXO[1] == 'X' && displayXO[2] == 'X') {
      setState(() {
        resultDeclaration = 'You loses!';
        matchedIndexes.addAll([0, 1, 2]);
        lose == true;
      });
    }
    //check 2nd row
    if (displayXO[3] == 'X' && displayXO[4] == 'X' && displayXO[5] == 'X') {
      setState(() {
        resultDeclaration = 'You loses!';
        matchedIndexes.addAll([3, 4, 5]);
        lose == true;
      });
    }
    //check 3rd row
    if (displayXO[6] == 'X' && displayXO[7] == 'X' && displayXO[8] == 'X') {
      setState(() {
        resultDeclaration = 'You loses!';
        matchedIndexes.addAll([6, 7, 8]);
        lose == true;
      });
    }
    //check 1st column
    if (displayXO[0] == 'X' && displayXO[3] == 'X' && displayXO[6] == 'X') {
      setState(() {
        resultDeclaration = 'You loses!';
        matchedIndexes.addAll([0, 3, 6]);
        lose == true;
      });
    }
    //check 2nd column
    if (displayXO[1] == 'X' && displayXO[4] == 'X' && displayXO[7] == 'X') {
      setState(() {
        resultDeclaration = 'You loses!';
        matchedIndexes.addAll([1, 4, 7]);
        lose == true;
      });
    }
    //check 3rd column
    if (displayXO[2] == 'X' && displayXO[5] == 'X' && displayXO[8] == 'X') {
      setState(() {
        resultDeclaration = 'You loses!';
        matchedIndexes.addAll([2, 5, 8]);
        lose == true;
      });
    }
    //check diagonal 1
    if (displayXO[0] == 'X' && displayXO[4] == 'X' && displayXO[8] == 'X') {
      setState(() {
        resultDeclaration = 'You loses!';
        matchedIndexes.addAll([0, 4, 8]);
        lose == true;
      });
    }
    //check diagonal 2
    if (displayXO[2] == 'X' && displayXO[4] == 'X' && displayXO[6] == 'X') {
      setState(() {
        resultDeclaration = 'You loses!';
        matchedIndexes.addAll([2, 4, 6]);
        lose == true;
      });
    }
    //check for  tie
    if (!win && filledBoxes == 9) {
      setState(() {
        resultDeclaration = 'Tie!';
        tie == true;
      });
    }
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = '';
      }
      resultDeclaration = '';
    });
    filledBoxes = 0;
    win = false;
    matchedIndexes.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Expanded(
              flex: 1,
              child: Center(
                child: Text("Tic-Tac-Toe Game", style: MainFont.white),
              )),
          Expanded(
            flex: 3,
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      if (win == false && lose == false && tie == false) {
                        _tapped(index);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          width: 5,
                          color: matchedIndexes.contains(index)
                              ? MainColor.accentColor
                              : MainColor.primaryColor,
                        ),
                        color: MainColor.secondaryColor,
                      ),
                      child: Center(
                        child: Text(
                          displayXO[index],
                          style: displayXO[index] == 'O'
                              ? MainFont.yours
                              : MainFont.computers,
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  resultDeclaration,
                  style: MainFont.white,
                ),
              )),
          Expanded(
              flex: 1,
              child: Center(
                child: ElevatedButton(
                    onPressed: () {
                      _clearBoard();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MainColor.accentColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.replay_outlined,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Reset',
                          style: MainFont.white,
                        ),
                      ],
                    )),
              )),
        ]),
      ),
    );
  }
}
