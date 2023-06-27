// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tipsy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const TipCalculator(
        title: 'Tipsy',
      ),
    );
  }
}

class TipCalculator extends StatefulWidget {
  const TipCalculator({super.key, required this.title});
  final String title;

  @override
  State<TipCalculator> createState() => _TipCalculatorstate();
}

class _TipCalculatorstate extends State<TipCalculator> {
  int _counter = 0;
  var bill = 112.63;
  var tip = 0.0;
  var totalPerPerson = 0.0;
  var tipChoice = 0.0;
  String customtip = '';
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _tipCalculator() {
    setState(() {
      if (tipChoice == 0.10) {
        tip = (bill * tipChoice) / _counter;
        bill = bill / _counter;
        bill = bill.ceilToDouble();
        tip = tip.ceilToDouble();
        totalPerPerson = bill + tip;
        totalPerPerson = totalPerPerson.ceilToDouble();
      } else if (tipChoice == 0.15) {
        tip = (bill * tipChoice) / _counter;
        bill = bill / _counter;
        bill = bill.ceilToDouble();
        tip = tip.ceilToDouble();
        totalPerPerson = bill + tip;
        totalPerPerson = totalPerPerson.ceilToDouble();
      } else if (tipChoice == 0.20) {
        tip = (bill * tipChoice) / _counter;
        bill = bill / _counter;
        bill = bill.ceilToDouble();
        tip = tip.ceilToDouble();
        totalPerPerson = bill + tip;
        totalPerPerson = totalPerPerson.ceilToDouble();
      } else if (tipChoice == 0.25) {
        tip = (bill * tipChoice) / _counter;
        bill = bill / _counter;
        bill = bill.ceilToDouble();
        tip = tip.ceilToDouble();
        totalPerPerson = bill + tip;
        totalPerPerson = totalPerPerson.ceilToDouble();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          leading: IconButton(
              // ignore:
              onPressed: () => print('Menu button pressed'),
              icon: const Icon(Icons.menu))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(right: 160, bottom: 20, top: 20),
              child: Text(
                'Enter Bill total',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 100, right: 100),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.currency_pound),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 175, top: 20, bottom: 20),
              child: Text(
                'Choose tip',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          tipChoice = 0.10;
                          _tipCalculator();
                        });
                      },
                      child: const Text('10%'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          tipChoice = 0.15;
                          _tipCalculator();
                        });
                      },
                      child: const Text('15%'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          tipChoice = 0.20;
                          _tipCalculator();
                        });
                      },
                      child: const Text('20%'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          tipChoice = 0.25;
                          _tipCalculator();
                        });
                      },
                      child: const Text('25%'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        customtip = 'customtip';
                        _tipCalculator();

                        print('customtip');
                      },
                      child: const Text('Custom Tip'),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 215, top: 20, bottom: 20),
                  child: Text(
                    'Split',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () => _decrementCounter(),
                      child: const Icon(Icons.remove),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    Text(
                      '$_counter',
                      style: const TextStyle(fontSize: 20),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    ElevatedButton(
                      onPressed: () => _incrementCounter(),
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    const SizedBox(
                      height: 300,
                      width: 300,
                      child: ColoredBox(color: Colors.green),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 75,
                        top: 50,
                      ),
                      child: Text(
                        'Total per person',
                        style: TextStyle(fontSize: 20, color: Colors.white70),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 80,
                        left: 90,
                      ),
                      child: Text(
                        '$totalPerPerson',
                        style: const TextStyle(
                            fontSize: 20, color: Colors.white70),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 170,
                        left: 80,
                      ),
                      child: Text(
                        'Bill',
                        style: TextStyle(fontSize: 20, color: Colors.white70),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 200,
                        left: 70,
                      ),
                      child: Text(
                        '$bill',
                        style: const TextStyle(
                            fontSize: 20, color: Colors.white70),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 170,
                        left: 200,
                      ),
                      child: Text(
                        'Tip',
                        style: TextStyle(fontSize: 20, color: Colors.white70),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 200,
                        left: 190,
                      ),
                      child: Text(
                        '$tip',
                        style: const TextStyle(
                            fontSize: 20, color: Colors.white70),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
