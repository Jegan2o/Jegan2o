import 'package:flutter/material.dart';
import 'package:flutter_application_2/add_nopt.dart';
import 'package:hive_flutter/hive_flutter.dart';

late Box box;
Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NotepadAdapter());
  box = await Hive.openBox('Notepad');
  // box.put('key', Notepad(note: 'Jian2027'));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  
  int count = box.length;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: Scaffold(
          floatingActionButton: FloatingActionButton(
              onPressed: () => null,
              tooltip: 'Add a new note',
              child: Icon(Icons.add_box)),
          body: SingleChildScrollView(
              child: Column(
            children: [
              TextField(
                  controller: controller,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder())),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          // count = box.length;
                          box.add(Notepad(note: controller.text));
                          // final data = Notepad(note: controller.text);
                          // box.put('key', Notepad(note: controller.text));
                          controller.clear();
                        });
                      },
                      child: const Text('Add')),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          count -= 1;
                        });
                      },
                      child: const Text('Remove'))
                ],
              ),
              WatchBoxBuilder(
                box: box,
                builder: (context, box) => ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    print({'index': index});
                    print({'length': box.toMap()});
                    Notepad nopte = box.getAt(index);
                    return Container(
                        color: Colors.blue,
                        child: ListTile(
                          leading: const Icon(
                            Icons.pedal_bike_sharp,
                          ),
                          title: Text('${index}. ${nopte.note}'),
                          subtitle: const Text('This the List View'),
                          trailing: Row(
                            children:[IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: (() => showModalBottomSheet(context: context, builder: build))),
                              IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: (() => box.deleteAt(index)),
                            ),]
                          ),
                        ));
                  },
                  itemCount: box.length,
                  shrinkWrap: true,
                ),
              )
            ],
          ))),
    );
  }
}
