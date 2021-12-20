import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dynamic_theme_flutter_bloc/counter_state.dart';
import 'counter_bloc.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  /**
      int _counter = 0;

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
   */

  //this _counterBloc replace the above setState----------
  final _counterBloc =CounterBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>_counterBloc,
      child:CounterWidget(widget: widget,),
    );

  }
  @override
  void dispose() {
    super.dispose();
    _counterBloc.close();
  }
}


class CounterWidget extends StatelessWidget{
  final MyHomePage widget;

  const CounterWidget({Key key, this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      //body: BlocBuilder(
      body: BlocBuilder(
          //bloc: _counterBloc,
          bloc: BlocProvider.of<CounterBloc>(context),
          builder: (context, CounterState counterState ) {
            // Under Center wrapped by the  Above BlocBuilder------
            return Center(
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 70.0,right: 70,),
                      child: Text(
                        'You have pushed the button this many times:',
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    '${counterState.counter}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            );
          }
      ),
      floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget>[
            FloatingActionButton(
              //onPressed: _incrementCounter,
              //onPressed: _counterBloc.onIncrement,
              onPressed:BlocProvider.of<CounterBloc>(context).onIncrement,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
            FloatingActionButton(
              //onPressed: _decrementCounter,
              //onPressed: _counterBloc.onDecrement,
              onPressed:BlocProvider.of<CounterBloc>(context).onDecrement,
              tooltip: 'Decrement',
              child: Icon(Icons.remove),
            ),
          ]

      ),
    );// This trailing comma makes auto-formatting nicer for build methods.
  }
  
}


/**
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
 /**
  int _counter = 0;

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
*/

  //this _counterBloc replace the above setState----------
  final _counterBloc =CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),


      body: BlocBuilder(
        bloc: _counterBloc,
        builder: (context, CounterState counterState ) {
          // Under Center wrapped by the  Above BlocBuilder------
          return Center(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 70.0,right: 70,),
                    child: Text(
                      'You have pushed the button this many times:',
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  '${counterState.counter}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          );
        }
      ),
      floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget>[
            FloatingActionButton(
              //onPressed: _incrementCounter,
              onPressed: _counterBloc.onIncrement,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
            FloatingActionButton(
              //onPressed: _decrementCounter,
              onPressed: _counterBloc.onDecrement,
              tooltip: 'Decrement',
              child: Icon(Icons.remove),
            ),
          ]

      ),
    );// This trailing comma makes auto-formatting nicer for build methods.
  }
  @override
  void dispose() {
    super.dispose();
    _counterBloc.close();
  }
}

*/


