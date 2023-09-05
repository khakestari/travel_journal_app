import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/user_journals.dart';

import './screens/journal_list_screen.dart';
import './screens/add_journal_screen.dart';
import './screens/journal_detail_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: UserJournals(),
      child: MaterialApp(
        title: 'Travel Journal App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.dark,
            // primary: const Color(0x404B69),
            // : const Color(0x283149),
            // seedColor: Color(0xFFF3ECC8),
            seedColor: const Color(0xFFF73859),
          ),
          useMaterial3: true,
        ),
        home: JournalListScreen(),
        routes: {
          AddJournalScreen.routName: (ctx) => AddJournalScreen(),
          JournalDetailScreen.routName: (ctx) => JournalDetailScreen()
        },
      ),
    );
  }
}
