import 'package:isar/isar.dart';
import 'package:kopma/data/model/cart/cart_collection.dart';
import 'package:path_provider/path_provider.dart';

/// A class representing a local database.
///
/// This class provides methods to initialize and access the Isar database.
class LocalDatabase {
  late final Isar _isar;
  bool _isInitialized = false;

  /// Returns the initialized Isar database instance.
  ///
  /// Throws an [IsarError] if the database has not been initialized.
  Isar get db => _isInitialized ? _isar : throw IsarError('Isar has not been initialized.');

  /// Initializes the Isar database.
  ///
  /// Throws an [IsarError] if the database has already been initialized.
  Future<void> initialize() async {
    if (_isInitialized) throw IsarError('Isar has already been initialized.');

    final directory = await getApplicationDocumentsDirectory();
    _isar = await Isar.open([CartCollectionSchema], directory: directory.path);

    _isInitialized = true;
  }
}