import 'package:flutter/material.dart';
import '../costum_widgets/button_increment.dart';

class GameScorePage extends StatefulWidget {
  @override
  State<GameScorePage> createState() => _GameScorePageState();
}

class _GameScorePageState extends State<GameScorePage> {
  int counter1 = 0;
  int counter2 = 0;
  int totalWinsteam1 = 0;
  int totalWinsteam2 = 0;

  bool get winner1 => counter1 >= 12;
  bool get winner2 => counter2 >= 12;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/truco.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(5.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const <Widget>[
                  Text(
                    "NÓS",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Text(
                    "ELES",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: 150.0,
                    height: 150.0,
                    alignment: const Alignment(0.0, 0.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "$counter1",
                          style: const TextStyle(
                            fontSize: 75.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Text(
                          "$totalWinsteam1",
                          style: const TextStyle(
                            fontSize: 22.0,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 150.0,
                    height: 150.0,
                    alignment: const Alignment(0.0, 0.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "$counter2",
                          style: const TextStyle(
                            fontSize: 75.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Text(
                          "$totalWinsteam2",
                          style: const TextStyle(
                            fontSize: 22.0,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                    child: const Icon(Icons.remove, color: Colors.black),
                    onPressed: () {
                      if (counter1 > 0) {
                        setState(() {
                          counter1--;
                        });
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                  ),
                  TextButton(
                    child: const Icon(Icons.remove, color: Colors.black),
                    onPressed: () {
                      if (counter2 > 0) {
                        setState(() {
                          counter2--;
                        });
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ButtonIncrement1(
                    width: 80.0,
                    qtd: 1,
                    incrementCounter1: incrementCounter1,
                  ),
                  ButtonIncrement2(
                    width: 80.0,
                    qtd: 1,
                    incrementCounter2: incrementCounter2,
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ButtonIncrement1(
                    width: 95.0,
                    qtd: 3,
                    incrementCounter1: incrementCounter1,
                  ),
                  ButtonIncrement2(
                    width: 95.0,
                    qtd: 3,
                    incrementCounter2: incrementCounter2,
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ButtonIncrement1(
                    width: 110.0,
                    qtd: 6,
                    incrementCounter1: incrementCounter1,
                  ),
                  ButtonIncrement2(
                    width: 110.0,
                    qtd: 6,
                    incrementCounter2: incrementCounter2,
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ButtonIncrement1(
                    width: 125.0,
                    qtd: 9,
                    incrementCounter1: incrementCounter1,
                  ),
                  ButtonIncrement2(
                    width: 125.0,
                    qtd: 9,
                    incrementCounter2: incrementCounter2,
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ButtonIncrement1(
                    width: 140.0,
                    qtd: 12,
                    incrementCounter1: incrementCounter1,
                  ),
                  ButtonIncrement2(
                    width: 140.0,
                    qtd: 12,
                    incrementCounter2: incrementCounter2,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: showDeleteScoreConfirmationDialog,
                    child: const Icon(
                      Icons.restart_alt_rounded,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  incrementCounter1(int qtd) {
    setState(() {
      if (!winner1) {
        counter1 += qtd;
        if (winner1) {
          totalWinsteam1++;
          counter1 = 0;
          counter2 = 0;
        }
      }
    });
  }

  incrementCounter2(int qtd) {
    setState(() {
      if (!winner2) {
        counter2 += qtd;
        if (winner2) {
          totalWinsteam2++;
          counter2 = 0;
          counter1 = 0;
        }
      }
    });
  }

  showDeleteScoreConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirmar ação"),
        content:
            const Text("Deseja zerar o placar e todas as partidas acumulas?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancelar"),
            style: TextButton.styleFrom(
              primary: Colors.blue,
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                counter1 = 0;
                counter2 = 0;
                totalWinsteam1 = 0;
                totalWinsteam2 = 0;
              });
              Navigator.of(context).pop();
            },
            child: const Text("Zerar"),
            style: TextButton.styleFrom(
              primary: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
