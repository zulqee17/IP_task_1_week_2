import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_two_task_one_a/provider/item_provider.dart';

import 'add_data_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        
        providers: [
          ChangeNotifierProvider(create: (context)=>ItemProvider())
        ],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddDataScreen(),
    )
    );
  }
}
