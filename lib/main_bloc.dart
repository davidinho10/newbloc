import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newbloc/bloc/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          create: (context) => CounterBloc(),
          child: const MyHomePage(title: 'Bloc Session'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  '${state.counter}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            ElevatedButton.icon(
              onPressed: () {
                BlocProvider.of<CounterBloc>(context).add(IncrementEvent());
              },
              icon: const Icon(Icons.add),
              label: const Text('Increment'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                BlocProvider.of<CounterBloc>(context).add(DecrementEvent());
              },
              icon: const Icon(Icons.remove),
              label: const Text('Decrement'),
            )
          ],
        ),
      ),
    );
  }
}
