import 'package:flutter/material.dart';
import 'fancy_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(title: 'Flutter Demo Hot Reload'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _reversed = false;
  final List<UniqueKey> _buttonKeys = [UniqueKey(), UniqueKey()];

  void _incrementCounter() => setState(() => _counter++);

  void _decrementCounter() => setState(() => _counter--);

  void _resetCounter() {
    setState(() => _counter = 0);
    _swap();
  }

  void _swap() => setState(() => _reversed = !_reversed);

  @override
  Widget build(BuildContext context) {
    final decrementButton = FancyButton(
      key: _buttonKeys.first,
      onPressed: _decrementCounter,
      child: const Text('Decrement Counter'),
    );
    final incrementButton = FancyButton(
      key: _buttonKeys.last,
      onPressed: _incrementCounter,
      child: const Text('Increment Counter'),
    );
    List<Widget> _buttons = <Widget>[incrementButton, decrementButton];
    if (_reversed) _buttons = _buttons.reversed.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 100.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.25),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Image.asset(
                'flutter_logo_1080.png',
                width: 100.0,
              ),
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ..._buttons,
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _resetCounter,
        tooltip: 'Reset Counter',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
