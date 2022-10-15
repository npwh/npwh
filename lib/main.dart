import 'package:apifinal/person.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DataPerson? _dataPerson;

  Future<String?> dataperson() async {
    var url = Uri.https('ttime.in.th', '/api.php');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        _dataPerson = dataPersonFromJson(response.body);
      });
      print(_dataPerson?.fullname);
      print(_dataPerson?.age);
      print(_dataPerson?.tall);
      return _dataPerson?.fullname;
    } else {
      print('ok 404');
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    dataperson();
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: Text('ชื่อ-นามสุล'),
            subtitle: Text(_dataPerson!.fullname),
          )
        ],
      ),
    );
  }
}
