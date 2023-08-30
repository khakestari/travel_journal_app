import 'package:flutter/material.dart';
import '../models/journal.dart';

class UserJournals with ChangeNotifier {
  List<Journal> _items = [];

  List<Journal> get items {
    return [..._items];
  }
}
