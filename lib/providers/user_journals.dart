import 'dart:io';

import 'package:flutter/material.dart';

import '../models/journal.dart';
import '../helpers/db_helper.dart';
import '../helpers/location_helper.dart';

class UserJournals with ChangeNotifier {
  List<Journal> _items = [];

  List<Journal> get items {
    return [..._items];
  }

  Future<void> addJournal(String pickedTitle, File pickedImage,
      JournalLocation pickedLocation) async {
    final address = await LocationHelper.getPlaceAddress(
        latitude: pickedLocation.latitude, longitude: pickedLocation.longitude);
    final updatedLocation = JournalLocation(
        latitude: pickedLocation.latitude,
        longitude: pickedLocation.longitude,
        address: address);
    final newJournal = Journal(
      id: DateTime.now().toString(),
      title: pickedTitle,
      location: updatedLocation,
      image: pickedImage,
    );
    _items.add(newJournal);
    notifyListeners();
    DBHelper.insert('user_journals', {
      'id': newJournal.id,
      'title': newJournal.title,
      'image': newJournal.image.path,
      'loc_lat': newJournal.location!.latitude,
      'loc_lng': newJournal.location!.longitude,
      'address': newJournal.location!.address!,
    });
  }

  Future<void> fetchAndSetJournals() async {
    final dataList = await DBHelper.getData('user_journals');
    _items = dataList
        .map(
          (item) => Journal(
            id: item['id'],
            title: item['title'],
            location: JournalLocation(
              latitude: item['loc_lat'],
              longitude: item['loc_lng'],
              address: item['address'],
            ),
            image: File(item['image']),
          ),
        )
        .toList();
    notifyListeners();
  }
}
