import 'package:flutter/material.dart';

class MyChangeNotifier extends StatelessWidget {
  MyChangeNotifier({super.key});

  final ValueNotifier<int> _counter = ValueNotifier<int>(10);
  final ValueNotifier<String> _xx = ValueNotifier<String>('sony');

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 500,
        height: 500,
        color: Colors.deepPurple.shade100,
        child: Row(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CounterBody(counterValueNotifier: _counter),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      // onPressed: () => _counter.value--,
                      onPressed: () {
                        _counter.value = _counter.value - 1;
                      },
                      child: const Icon(Icons.remove),
                    ),
                    TextButton(
                      // onPressed: () => _counter.value++,
                      onPressed: () {
                        _counter.value = _counter.value + 1;
                      },
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CounterBody(counterValueNotifier: _xx),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        _xx.value = _xx.value.substring(0, _xx.value.length - 1);
                      },
                      child: const Icon(
                        Icons.remove,
                        size: 50,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _xx.value = '${_xx.value}!';
                      },
                      child: const Icon(
                        Icons.add,
                        size: 50,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CounterBody extends StatelessWidget {
  const CounterBody({super.key, required this.counterValueNotifier});

  final ValueNotifier<dynamic> counterValueNotifier;

  @override
  Widget build(BuildContext context) {
    print('CounterBody build');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Current counter value:'),
          // Thanks to the [AnimatedBuilder], only the widget displaying the
          // current count is rebuilt when `counterValueNotifier` notifies its
          // listeners. The [Text] widget above and [CounterBody] itself aren't
          // rebuilt.
          AnimatedBuilder(
            // [AnimatedBuilder] accepts any [Listenable] subtype.
            animation: counterValueNotifier,
            builder: (BuildContext context, Widget? child) {
              print('AnimatedBuilder');
              return Row(
                children: <Widget>[
                  Text('${counterValueNotifier.value}'),
                  child!,
                ],
              );
            },
            child: Container(width: 20, height: 20, color: Colors.green),
          ),
        ],
      ),
    );
  }
}
