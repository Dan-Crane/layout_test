import 'package:flutter/material.dart';
import 'package:layout_test/responcive/orientation_layout.dart';
import 'package:layout_test/responcive/screen_type_layout.dart';

void main() {
  runApp(const MyApp());
}

final ValueNotifier<ThemeMode> themeMode = ValueNotifier(ThemeMode.light);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeMode,
        builder: (_, mode, __) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: mode,
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    themeMode.value =
        themeMode.value == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait:
              const NumberList(length: 100, scrollDirection: Axis.vertical),
          landscape: Center(
            child: Card(
              child: Text(
                'Flip phone',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
          ),
        ),
        desktop: Row(
          children: [
            Flexible(
              child: Center(
                child: Text(
                  'This is left side',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
            Expanded(
              child: NumberList(length: 100, scrollDirection: Axis.vertical),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NumberList extends StatefulWidget {
  final int length;
  final Axis scrollDirection;

  const NumberList(
      {super.key, required this.length, required this.scrollDirection});

  @override
  State<NumberList> createState() => _NumberListState();
}

class _NumberListState extends State<NumberList> {
  late var items = <String>[];
  @override
  void initState() {
    super.initState();

    items = List.generate(widget.length, (index) => 'Item order is $index');
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: widget.scrollDirection,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        return Card(
          child: Text(
            item,
            style: Theme.of(context).textTheme.headline4,
          ),
        );
      },
    );
  }
}
