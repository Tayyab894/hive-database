import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

// boxes are like files in hive to storage data

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Hive Database")),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: Hive.openBox('Tayyab'),
            builder: (context, snapshot) {
              return Column(
                children: [
                  ListTile(
                    title: Text(snapshot.data!.get('Name').toString()),
                    subtitle: Text(snapshot.data!.get('Age').toString()),
                    trailing: IconButton(
                        onPressed: () {
                          snapshot.data!.put('Name', 'Tayyab');
                          // snapshot.data!.put('Age', '20');
                            snapshot.data!.delete('Age');
                          setState(() {
                            
                          });
                        },
                        icon: Icon(Icons.delete)),
                  ),
                ],
              );
            },
          ),
          FutureBuilder(
            future: Hive.openBox('Name'),
            builder: (context, snapshot) {
              return Column(
                children: [
                  ListTile(
                    title: Text(snapshot.data!.get('youtube').toString()),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var box = await Hive.openBox("Tayyab");
          var box2 = await Hive.openBox("Name");

          box2.put('youtube', 'StarCo');

          box.put("Name", "Tayyab Naseer");
          box.put("Age", "25");
          box.put("Details", {'project': "hive database", 'Intern': 'Uraan'});
          print(box.get('Name'));
          print(box.get('Age'));
          print(box.get('Details')['Intern']);
          print(box2.get('youtube'));
        },
        child:const Icon(Icons.add),
      ),
    );
  }
}
