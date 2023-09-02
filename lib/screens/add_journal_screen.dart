import 'package:flutter/material.dart';

import '../widgets/image_input.dart';

class AddJournalScreen extends StatefulWidget {
  static const routName = '/add-journal';

  const AddJournalScreen({super.key});

  @override
  State<AddJournalScreen> createState() => _AddJournalScreenState();
}

class _AddJournalScreenState extends State<AddJournalScreen> {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new Journal'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(label: Text('Title')),
                      controller: _titleController,
                    ),
                    SizedBox(height: 10),
                    ImageInput()
                  ],
                ),
              ),
            ),
          ),

          //  Form(child: child),
          TextButton.icon(
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(),
                // side: RoundedRectangleBorder(),
                backgroundColor: Colors.brown,
                elevation: 0,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap),
            icon: const Icon(Icons.add),
            label: const Text('Add journal'),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
