import 'package:flutter/material.dart';

import 'logging.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String title = 'Smart Logging';

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final log = logger(MainPage);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton('DEBUG', Colors.blue, () => log.d('Debug message')),
              buildButton('INFO', Colors.blue, () => log.i('Info message')),
              buildButton(
                  'WARNING', Colors.orange, () => log.w('Warning message')),
              buildButton('ERROR', Colors.red, () => log.e('Error message')),
              buildButton('WTF', Colors.red, () => log.wtf('Wtf message')),
            ],
          ),
        ),
      );

  Widget buildButton(
    String text,
    Color color,
    VoidCallback onClicked,
  ) =>
      Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: RaisedButton(
          child: Text(text),
          shape: StadiumBorder(),
          textColor: Colors.white,
          color: color,
          onPressed: onClicked,
        ),
      );
}
