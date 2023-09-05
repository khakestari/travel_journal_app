import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/journal.dart';
import '../widgets/image_input.dart';
import '../providers/user_journals.dart';
import '../widgets/location_input.dart';

class AddJournalScreen extends StatefulWidget {
  static const routName = '/add-journal';
  const AddJournalScreen({super.key});
  @override
  State<AddJournalScreen> createState() => _AddJournalScreenState();
}

class _AddJournalScreenState extends State<AddJournalScreen> {
  final _titleController = TextEditingController();
  File? _pickedImage;
  JournalLocation? _pickedLocation;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _selectPlace(double lat, double lng) {
    _pickedLocation = JournalLocation(latitude: lat, longitude: lng);
  }

  void _saveJournal() {
    if (_titleController.text.isEmpty ||
        _pickedImage == null ||
        _pickedLocation == null) {
      return;
    }
    Provider.of<UserJournals>(context, listen: false)
        .addJournal(_titleController.text, _pickedImage!, _pickedLocation!);
    Navigator.of(context).pop();
  }

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
                    const SizedBox(height: 10),
                    ImageInput(_selectImage),
                    SizedBox(height: 10),
                    LocationInput(_selectPlace),
                  ],
                ),
              ),
            ),
          ),

          //  Form(child: child),
          TextButton.icon(
            style: TextButton.styleFrom(
                shape: const RoundedRectangleBorder(),
                // side: RoundedRectangleBorder(),
                backgroundColor: Colors.brown,
                elevation: 0,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap),
            icon: const Icon(Icons.add),
            label: const Text('Add journal'),
            onPressed: _saveJournal,
          ),
        ],
      ),
    );
  }
}
