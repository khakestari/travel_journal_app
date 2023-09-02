import 'package:flutter/material.dart';

import './add_journal_screen.dart';

class JournalListScreen extends StatelessWidget {
  const JournalListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Journal'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddJournalScreen.routName);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
