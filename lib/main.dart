
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mj_hive_data_base/home_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'model/notes_model.dart';
import 'package:flutter/foundation.dart' show kIsWeb;


// Only use for IOS and android.
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   var directory = await getApplicationDocumentsDirectory();
//   String path = directory.path;
//
//
//   Hive.init(path);
//   Hive.registerAdapter(NotesModelAdapter());
//   await Hive.openBox<NotesModel>('notes');
//
//   runApp(const MaterialApp(
//     title: 'My App',
//     home: MyApp(),
//   ));
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String path = "";
  if (!kIsWeb) {
    var directory = await getApplicationDocumentsDirectory();
    path = directory.path;
  } else {
    // Use a hardcoded path for web.
    path = "/assets/db";
  }

  await Hive.initFlutter();
  Hive.registerAdapter(NotesModelAdapter());
  await Hive.openBox<NotesModel>('notes');

  runApp(const MaterialApp(
    title: 'My App',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Hive Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: const HomeScreen());
  }
}
