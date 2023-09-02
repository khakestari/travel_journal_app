import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './add_journal_screen.dart';
import '../providers/user_journals.dart';

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
      body: Consumer<UserJournals>(
        builder: (ctx, userJournals, ch) => userJournals.items.length <= 0
            ? ch!
            : ListView.builder(
                itemCount: userJournals.items.length,
                itemBuilder: (ctx, i) => ListTile(
                  title: Text(userJournals.items[i].title),
                  leading: CircleAvatar(
                    backgroundImage: FileImage(userJournals.items[i].image),
                  ),
                  onTap: () {},
                ),
              ),
        child: const Center(
          child: Text('Got no journal yet, start adding some'),
        ),
      ),
    );
  }
}
