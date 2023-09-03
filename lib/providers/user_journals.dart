import 'dart:io';

import 'package:flutter/material.dart';

import '../models/journal.dart';

class UserJournals with ChangeNotifier {
  List<Journal> _items = [];

  List<Journal> get items {
    return [..._items];
  }

  void addJournal(String pickedTitle, File pickedImage) {
    final newJournal = Journal(
      id: DateTime.now().toString(),
      title: pickedTitle,
      location: null,
      image: pickedImage,
    );
    _items.add(newJournal);
    notifyListeners();
  }
}
