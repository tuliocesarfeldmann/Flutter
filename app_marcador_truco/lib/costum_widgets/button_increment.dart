import 'package:flutter/material.dart';

class ButtonIncrement1 extends StatelessWidget {
  ButtonIncrement1({
    Key? key,
    required this.width,
    required this.qtd,
    required this.incrementCounter1,
  }) : super(key: key);

  double width;
  int qtd;
  Function(int) incrementCounter1;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        incrementCounter1(qtd);
      },
      child: Text(
        "+ $qtd",
        style: const TextStyle(
          color: Colors.black,
          fontSize: 25.0,
          fontWeight: FontWeight.w700,
        ),
      ),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(const Color.fromRGBO(255, 255, 255, 1)),
        fixedSize: MaterialStateProperty.all<Size>(Size(width, 80.0)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
            side: const BorderSide(
              color: Colors.black,
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonIncrement2 extends StatelessWidget {
  ButtonIncrement2({
    Key? key,
    required this.width,
    required this.qtd,
    required this.incrementCounter2,
  }) : super(key: key);

  double width;
  int qtd;
  Function(int) incrementCounter2;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        incrementCounter2(qtd);
      },
      child: Text(
        "+ $qtd",
        style: const TextStyle(
          color: Colors.black,
          fontSize: 25.0,
          fontWeight: FontWeight.w700,
        ),
      ),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(const Color.fromRGBO(255, 255, 255, 1)),
        fixedSize: MaterialStateProperty.all<Size>(Size(width, 80.0)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
            side: const BorderSide(
              color: Colors.black,
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
