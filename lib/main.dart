import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/user_journals.dart';

import './screens/journal_list_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: UserJournals(),
      child: MaterialApp(
        title: 'Travel Journal App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: JournalListScreen(),
      ),
    );
  }
}
