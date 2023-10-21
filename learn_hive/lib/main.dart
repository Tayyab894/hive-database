//1) android > app> src>main>androidmanifest.xml (on top)
// <uses-permission
//         android:name="android.permission.MANAGE_EXTERNAL_STORAGE" />
//     <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
//     <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />

// 2) initialize database
//  in main.dart on top after void main => WidgetsFlutterBinding.ensureInitialized();

// 3) create directories using path provider
// below initialization var directory= await getApplicationDocumentsDirectory();
// Hive.init(directory.path);

// 4)  make floating button below column
    // floatingActionButton: FloatingActionButton(
    //     onPressed: () async {
    //       var box = await Hive.openBox("Tayyab");
    //       box.put("Name", "Tayyab Naseer");
    //          box.put("Age", "25");
    //       print(box.get('Name'));
    //       print(box.get('Age'));
    //     },
    //     child: Icon(Icons.add),
    //   ),


// 5) how to show it on ui

// Column(
//      children: [
//       ListTile(
//      title: Text(snapshot.data!.get('Name').toString()),
//      subtitle: Text(snapshot.data!.get('Age').toString()),
//         ),
//         ],
//       );

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:learn_hive/home_screen.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
          ),
      home: const HomeScreen(),
    );
  }
}
