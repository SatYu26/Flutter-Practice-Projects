import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentstep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stepper(
        steps: _mySteps(),
        currentStep: this._currentstep,
        onStepTapped: (step) {
          setState(() {
            this._currentstep = step;
          });
        },
        onStepContinue: () {
          setState(() {
            if (this._currentstep < this._mySteps().length - 1) {
              this._currentstep = this._currentstep + 1;
            } else {
              // logic to check if everything is completed
              print('completed');
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (this._currentstep > 0) {
              this._currentstep = this._currentstep - 1;
            } else {
              this._currentstep = 0;
            }
          });
        },
      ),
    );
  }

  List<Step> _mySteps() {
    List<Step> _steps = [
      Step(
        title: Text('Step 1'),
        content: TextField(),
        isActive: _currentstep >= 0,
      ),
      Step(
        title: Text('Step 2'),
        content: TextField(),
        isActive: _currentstep >= 1,
      ),
      Step(
        title: Text('Step 3'),
        content: TextField(),
        isActive: _currentstep >= 2,
      ),
    ];
    return _steps;
  }
}
