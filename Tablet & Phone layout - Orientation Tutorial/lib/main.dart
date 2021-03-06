import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final double shortestSide = MediaQuery.of(context).size.shortestSide;
    final bool useMobileLayout = shortestSide < 600;
    final Orientation orientation = MediaQuery.of(context).orientation;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: useMobileLayout
          ? buildPhoneGridView(orientation: orientation)
          : buildTabletGridView(orientation: orientation),
    );
  }

  GridView buildPhoneGridView({@required Orientation orientation}) {
    return GridView.count(
      crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
      children: List.generate(100, (index) {
        return Card(
          child: Container(
            alignment: Alignment.center,
            color: Colors.teal[100 * (index % 9)],
            child: new Text('grid item $index'),
          ),
        );
      }),
    );
  }

  GridView buildTabletGridView({@required Orientation orientation}) {
    return GridView.count(
      crossAxisCount: orientation == Orientation.portrait ? 4 : 5,
      children: List.generate(100, (index) {
        return Card(
          child: Container(
            alignment: Alignment.center,
            color: Colors.teal[100 * (index % 9)],
            child: new Text('grid item $index'),
          ),
        );
      }),
    );
  }
}
