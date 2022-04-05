import 'package:flutter/material.dart';

void main() => runApp(const AppContaPessoas());

class AppContaPessoas extends StatelessWidget {
  const AppContaPessoas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  bool get isEmpty => _counter == 0;
  bool get isFull => _counter == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 90, 90, 90),
      body: _buildBodyAplication(),
    );
  }

  Widget _buildBodyAplication() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/appImage.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              isFull ? "Capacidade máxima atingida!" : "Pode entrar!",
              style: (isFull
                  ? const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                    )
                  : const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    )),
              textScaleFactor: 2.0,
            ),
            const SizedBox(height: 40),
            Text(
              '$_counter',
              textScaleFactor: 3.0,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  onPressed: _decrement,
                  child: const Text(
                    "Saiu",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isEmpty ? Colors.white.withOpacity(0.2) : Colors.white,
                    fixedSize: const Size(100, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    primary: Colors.black,
                  ),
                ),
                const SizedBox(width: 30),
                TextButton(
                  onPressed: _increment,
                  child: const Text(
                    "Entrou",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isFull ? Colors.white.withOpacity(0.2) : Colors.white,
                    fixedSize: const Size(100, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    primary: Colors.black,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _increment() {
    setState(() {
      isFull ? null : _counter++;
    });
  }

  _decrement() {
    setState(() {
      isEmpty ? null : _counter--;
    });
  }
}
