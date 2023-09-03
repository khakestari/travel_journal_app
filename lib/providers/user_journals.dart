import 'dart:io';

import 'package:flutter/material.dart';

import '../models/journal.dart';
import '../helpers/db_helper.dart';

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
    DBHelper.insert('user_journals', {
      'id': newJournal.id,
      'title': newJournal.title,
      'image': newJournal.image.path,
    });
  }

  Future<void> fetchAndSetJournals() async {
    final dataList = await DBHelper.getData('user_journals');
    _items = dataList
        .map(
          (item) => Journal(
            id: item['id'],
            title: item['title'],
            location: null,
            image: File(item['image']),
          ),
        )
        .toList();
    notifyListeners();
  }
}
