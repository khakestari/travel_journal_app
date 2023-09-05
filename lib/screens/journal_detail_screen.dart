import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_journals.dart';
import './map_screen.dart';

class JournalDetailScreen extends StatelessWidget {
  static const routName = '/journal-deatil';
  const JournalDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments;
    final selectedJournal = Provider.of<UserJournals>(context, listen: false)
        .findById(id.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedJournal.title),
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            child: Image.file(
              selectedJournal.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            selectedJournal.location!.address!,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          const SizedBox(height: 10),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (ctx) =>
                        MapScreen(initialLocation: selectedJournal.location!)));
              },
              child: const Text('View on map'))
        ],
      ),
    );
  }
}
