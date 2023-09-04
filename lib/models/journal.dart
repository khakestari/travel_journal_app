import 'dart:io';

class JournalLocation {
  final double latitude;
  final double longitude;
  final String? address;

  const JournalLocation(
      {required this.latitude, required this.longitude, this.address});
}

class Journal {
  final String id;
  final String title;
  final JournalLocation? location;
  final File image;

  Journal(
      {required this.id,
      required this.title,
      required this.location,
      required this.image});
}
