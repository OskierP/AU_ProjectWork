import 'dart:convert';
import 'dart:developer';
import 'dart:js';
import 'package:flutter/material.dart';
import 'package:proj_work/search.dart';
import 'package:proj_work/supabase.dart';
import 'package:supabase/supabase.dart';
import 'package:search_page/search_page.dart';

void main() {
  runApp(const MyApp());
}

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
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);


  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  Supabase supabase = Supabase();
  // int _counter = 0
  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // FutureBuilder _getSmth() {
  //   return FutureBuilder(
  //       future: supabase.getData(),
  //       builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
  //         if (snapshot.hasError) {
  //           return Text('${snapshot.error}');
  //         }
  //         else if (snapshot.hasData) {
  //           return Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: getColumn(snapshot.data),
  //           );
  //         }
  //         return const Material(
  //           child: Text('Loading'),
  //         );
  //       }
  //   );
  // }




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
      title: Text(widget.title),
    ),
    body: Center(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  IconButton(onPressed: (){}, icon: const Icon(Icons.help)),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.home)),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.health_and_safety_sharp)),

                ],
              )
            ),
            Container(child: TextButton(onPressed: () async { List<dynamic> x = await getList2(await supabase.getData()); print(getList2(await supabase.getData())); showSearch(context: this.context, delegate: Search(x));}, child: Icon(Icons.search))),

          ],
        )
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    ), // This trailing comma makes auto-formatting nicer for build methods.
  );
}

}


List<SizedBox> getColumn(var datas){
  List<SizedBox> list = [];
  for( var data in datas){
  list.add(SizedBox(
    child: Text(
      '${data['name2']}'
    ),

  ));
  }

  return list ;
}

List<String> getList(var datas, String name){
  List<String> list =[];
  for(var data in datas){
    list.add(data[name]);
  }
  return list;
}

List<dynamic> getList2(var datas){
  List<dynamic> list =[];
  for(var data in datas){
    list.add(data);
  }
  return list;
}




// Column test( var datas){
//
//   for(var data in datas){
//     print(data);
//   }
//   return
// }



