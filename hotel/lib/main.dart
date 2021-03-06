import 'dart:math';
import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MyApp());
  /*
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
  */
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        backgroundColor: Colors.blueGrey.shade100,
        primaryColor: Color(0xffbb86fc),
        accentColor: Color(0xffbb86fc),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a bSlue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
        buttonColor: Color(0xffbb86fc),
        //primaryColor: Colors.black54,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      ///*
      home: FutureBuilder(
        future: _fbApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("You have an error! ${snapshot.error.toString()}");
            return Text("Something went wrong!");
          } else if (snapshot.hasData) {
            return MyHomePage(title: "MAD Hotel");
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )
      //*/
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {

    DatabaseReference _testRef = FirebaseDatabase.instance.reference().child("test");
    _testRef.set("Hello World ${Random().nextInt(100)}");

    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          //margin: const EdgeInsets.all(100.0),
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 40,
                    width: 225,
                    child: RaisedButton(
                      textColor: Color(0xFF303030),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HotelList()),
                        );
                      },
                      child: const Text('List Hotels', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 40,
                  width: 225,
                  child: RaisedButton(
                    textColor: Color(0xFF303030),
                    onPressed: () {
                      createData();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondRoute()),
                      );
                    },
                    child: const Text('Create Booking', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 40,
                  width: 225,
                  child: RaisedButton(
                    textColor: Color(0xFF303030),
                    onPressed: () {},
                    child: const Text('Update Booking', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 40,
                  width: 225,
                  child: RaisedButton(
                    textColor: Color(0xFF303030),
                    onPressed: () {},
                    child: const Text('Delete Booking', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HotelList()),
            );
          },
        ),
      ),
    );
  }
}
class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Route'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  'Data Has Been Created'
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  deleteData();
                },
                child: Text('Go Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class HotelList extends StatelessWidget {
  final dbRef = FirebaseDatabase.instance.reference().child("Hotels");
  List<Map<dynamic, dynamic>> lists = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hotel List"),
      ),
      body: Center(
        child: Container(
        margin: const EdgeInsets.all(10.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //final dbRef = FirebaseDatabase.instance.reference().child("pets");
                FutureBuilder(
                    future: dbRef.once(),
                    builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                      if (snapshot.hasData) {
                        lists.clear();
                        Map<dynamic, dynamic> values = snapshot.data.value;
                        values.forEach((key, values) {
                          lists.add(values);
                        });
                        return new ListView.builder(
                            shrinkWrap: true,
                            itemCount: lists.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                child: InkWell(
                                  splashColor: Colors.purple.withAlpha(30),
                                  onTap: () {
                                    //print('Card tapped.');
                                  },
                                  child: Container(
                                    height: 40,
                                    width: double.infinity,
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(lists[index]["hName"]),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                      }
                      return CircularProgressIndicator();
                    }),
                Card(
                  //height: 100,
                  child: InkWell(
                    splashColor: Colors.purple.withAlpha(30),
                    onTap: () {
                      //print('Card tapped.');
                    },
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Go back'),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
          ),
        ),
      ),
    );
  }
}
void createData() {
  final dbRef = FirebaseDatabase.instance.reference().child("Booking");
  dbRef.child("B3").set({
    'eDate': '03/11/21',
    'guest': 'G1',
    'hotel': 'H5',
    'room': 'R1',
    'sDate': '03/10/21'
  });
}

void deleteData() {
  final dbRef = FirebaseDatabase.instance.reference().child("Booking");
  dbRef.child('B3').remove();
}
