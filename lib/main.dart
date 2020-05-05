import 'package:flutter/material.dart';
import 'package:mvp_pattern_flutter_demo/counter/counter_presenter.dart';
import 'package:mvp_pattern_flutter_demo/counter/counter_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVP Pattern Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  CounterWidget({Key key}) : super(key: key);

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> implements CounterView {
  CounterPresenter presenter;
  int count = 0;

  _CounterWidgetState() {
    presenter = new CounterPresenter();
    presenter.attachView(this);
  }

  @override
  void dispose() {
    if (presenter != null) {
      presenter.deattachView();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo MVP"),
      ),
      body: Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  presenter.decrement();
                },
                child: Text(
                  "-",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text("$count",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              ),
              RaisedButton(
                onPressed: () {
                  presenter.increment();
                },
                child: Text(
                  "+",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onDecrement(int value) {
    setState(() {
      count = value;
    });
  }

  @override
  void onIncrement(int value) {
    setState(() {
      count = value;
    });
  }
}
