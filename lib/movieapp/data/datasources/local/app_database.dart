
import 'package:floor/floor.dart';
import 'package:mentali/movieapp/data/datasources/local/dao/movie_dao.dart';
import 'package:mentali/movieapp/data/datasources/local/converter/type_converters.dart';

import '../../models/movie_detail.dart';

import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

part 'app_database.g.dart';

@Database(version: 1, entities: [MovieDetail])
@TypeConverters([
  BelongsToCollectionsConverter,
  GenreListConverter,
  ProductionCompanyListConverter,
  SpokenLanguageListConverter,
  StringListConverter,
  ProductionCountryListConverter
])
abstract class AppDatabase extends FloorDatabase {
  MovieDao get movieDao;
}