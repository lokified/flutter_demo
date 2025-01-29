// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MovieDao? _movieDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `movies` (`adult` INTEGER NOT NULL, `backdropPath` TEXT, `belongsToCollection` TEXT, `budget` INTEGER, `genres` TEXT, `homepage` TEXT, `id` INTEGER NOT NULL, `imdbId` TEXT, `originCountry` TEXT, `originalLanguage` TEXT, `originalTitle` TEXT, `overview` TEXT, `popularity` REAL, `posterPath` TEXT, `productionCompanies` TEXT, `productionCountries` TEXT, `releaseDate` TEXT, `revenue` INTEGER, `runtime` INTEGER, `spokenLanguages` TEXT, `status` TEXT, `tagline` TEXT, `title` TEXT, `video` INTEGER, `voteAverage` REAL, `voteCount` INTEGER, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MovieDao get movieDao {
    return _movieDaoInstance ??= _$MovieDao(database, changeListener);
  }
}

class _$MovieDao extends MovieDao {
  _$MovieDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _movieDetailInsertionAdapter = InsertionAdapter(
            database,
            'movies',
            (MovieDetail item) => <String, Object?>{
                  'adult': item.adult ? 1 : 0,
                  'backdropPath': item.backdropPath,
                  'belongsToCollection': _belongsToCollectionsConverter
                      .encode(item.belongsToCollection),
                  'budget': item.budget,
                  'genres': _genreListConverter.encode(item.genres),
                  'homepage': item.homepage,
                  'id': item.id,
                  'imdbId': item.imdbId,
                  'originCountry':
                      _stringListConverter.encode(item.originCountry),
                  'originalLanguage': item.originalLanguage,
                  'originalTitle': item.originalTitle,
                  'overview': item.overview,
                  'popularity': item.popularity,
                  'posterPath': item.posterPath,
                  'productionCompanies': _productionCompanyListConverter
                      .encode(item.productionCompanies),
                  'productionCountries': _productionCountryListConverter
                      .encode(item.productionCountries),
                  'releaseDate': item.releaseDate,
                  'revenue': item.revenue,
                  'runtime': item.runtime,
                  'spokenLanguages':
                      _spokenLanguageListConverter.encode(item.spokenLanguages),
                  'status': item.status,
                  'tagline': item.tagline,
                  'title': item.title,
                  'video': item.video == null ? null : (item.video! ? 1 : 0),
                  'voteAverage': item.voteAverage,
                  'voteCount': item.voteCount
                }),
        _movieDetailUpdateAdapter = UpdateAdapter(
            database,
            'movies',
            ['id'],
            (MovieDetail item) => <String, Object?>{
                  'adult': item.adult ? 1 : 0,
                  'backdropPath': item.backdropPath,
                  'belongsToCollection': _belongsToCollectionsConverter
                      .encode(item.belongsToCollection),
                  'budget': item.budget,
                  'genres': _genreListConverter.encode(item.genres),
                  'homepage': item.homepage,
                  'id': item.id,
                  'imdbId': item.imdbId,
                  'originCountry':
                      _stringListConverter.encode(item.originCountry),
                  'originalLanguage': item.originalLanguage,
                  'originalTitle': item.originalTitle,
                  'overview': item.overview,
                  'popularity': item.popularity,
                  'posterPath': item.posterPath,
                  'productionCompanies': _productionCompanyListConverter
                      .encode(item.productionCompanies),
                  'productionCountries': _productionCountryListConverter
                      .encode(item.productionCountries),
                  'releaseDate': item.releaseDate,
                  'revenue': item.revenue,
                  'runtime': item.runtime,
                  'spokenLanguages':
                      _spokenLanguageListConverter.encode(item.spokenLanguages),
                  'status': item.status,
                  'tagline': item.tagline,
                  'title': item.title,
                  'video': item.video == null ? null : (item.video! ? 1 : 0),
                  'voteAverage': item.voteAverage,
                  'voteCount': item.voteCount
                }),
        _movieDetailDeletionAdapter = DeletionAdapter(
            database,
            'movies',
            ['id'],
            (MovieDetail item) => <String, Object?>{
                  'adult': item.adult ? 1 : 0,
                  'backdropPath': item.backdropPath,
                  'belongsToCollection': _belongsToCollectionsConverter
                      .encode(item.belongsToCollection),
                  'budget': item.budget,
                  'genres': _genreListConverter.encode(item.genres),
                  'homepage': item.homepage,
                  'id': item.id,
                  'imdbId': item.imdbId,
                  'originCountry':
                      _stringListConverter.encode(item.originCountry),
                  'originalLanguage': item.originalLanguage,
                  'originalTitle': item.originalTitle,
                  'overview': item.overview,
                  'popularity': item.popularity,
                  'posterPath': item.posterPath,
                  'productionCompanies': _productionCompanyListConverter
                      .encode(item.productionCompanies),
                  'productionCountries': _productionCountryListConverter
                      .encode(item.productionCountries),
                  'releaseDate': item.releaseDate,
                  'revenue': item.revenue,
                  'runtime': item.runtime,
                  'spokenLanguages':
                      _spokenLanguageListConverter.encode(item.spokenLanguages),
                  'status': item.status,
                  'tagline': item.tagline,
                  'title': item.title,
                  'video': item.video == null ? null : (item.video! ? 1 : 0),
                  'voteAverage': item.voteAverage,
                  'voteCount': item.voteCount
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MovieDetail> _movieDetailInsertionAdapter;

  final UpdateAdapter<MovieDetail> _movieDetailUpdateAdapter;

  final DeletionAdapter<MovieDetail> _movieDetailDeletionAdapter;

  @override
  Future<List<MovieDetail>> findAllMovies() async {
    return _queryAdapter.queryList('SELECT * FROM movies',
        mapper: (Map<String, Object?> row) => MovieDetail(
            adult: (row['adult'] as int) != 0,
            backdropPath: row['backdropPath'] as String?,
            belongsToCollection: _belongsToCollectionsConverter
                .decode(row['belongsToCollection'] as String?),
            budget: row['budget'] as int?,
            genres: _genreListConverter.decode(row['genres'] as String?),
            homepage: row['homepage'] as String?,
            id: row['id'] as int,
            imdbId: row['imdbId'] as String?,
            originCountry:
                _stringListConverter.decode(row['originCountry'] as String?),
            originalLanguage: row['originalLanguage'] as String?,
            originalTitle: row['originalTitle'] as String?,
            overview: row['overview'] as String?,
            popularity: row['popularity'] as double?,
            posterPath: row['posterPath'] as String?,
            productionCompanies: _productionCompanyListConverter
                .decode(row['productionCompanies'] as String?),
            productionCountries: _productionCountryListConverter
                .decode(row['productionCountries'] as String?),
            releaseDate: row['releaseDate'] as String?,
            revenue: row['revenue'] as int?,
            runtime: row['runtime'] as int?,
            spokenLanguages: _spokenLanguageListConverter
                .decode(row['spokenLanguages'] as String?),
            status: row['status'] as String?,
            tagline: row['tagline'] as String?,
            title: row['title'] as String?,
            video: row['video'] == null ? null : (row['video'] as int) != 0,
            voteAverage: row['voteAverage'] as double?,
            voteCount: row['voteCount'] as int?));
  }

  @override
  Future<MovieDetail?> getMovieById(int id) async {
    return _queryAdapter.query('SELECT * FROM movies WHERE id = ?1',
        mapper: (Map<String, Object?> row) => MovieDetail(
            adult: (row['adult'] as int) != 0,
            backdropPath: row['backdropPath'] as String?,
            belongsToCollection: _belongsToCollectionsConverter
                .decode(row['belongsToCollection'] as String?),
            budget: row['budget'] as int?,
            genres: _genreListConverter.decode(row['genres'] as String?),
            homepage: row['homepage'] as String?,
            id: row['id'] as int,
            imdbId: row['imdbId'] as String?,
            originCountry:
                _stringListConverter.decode(row['originCountry'] as String?),
            originalLanguage: row['originalLanguage'] as String?,
            originalTitle: row['originalTitle'] as String?,
            overview: row['overview'] as String?,
            popularity: row['popularity'] as double?,
            posterPath: row['posterPath'] as String?,
            productionCompanies: _productionCompanyListConverter
                .decode(row['productionCompanies'] as String?),
            productionCountries: _productionCountryListConverter
                .decode(row['productionCountries'] as String?),
            releaseDate: row['releaseDate'] as String?,
            revenue: row['revenue'] as int?,
            runtime: row['runtime'] as int?,
            spokenLanguages: _spokenLanguageListConverter
                .decode(row['spokenLanguages'] as String?),
            status: row['status'] as String?,
            tagline: row['tagline'] as String?,
            title: row['title'] as String?,
            video: row['video'] == null ? null : (row['video'] as int) != 0,
            voteAverage: row['voteAverage'] as double?,
            voteCount: row['voteCount'] as int?),
        arguments: [id]);
  }

  @override
  Future<void> insertMovie(MovieDetail movie) async {
    await _movieDetailInsertionAdapter.insert(
        movie, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateMovie(MovieDetail movie) async {
    await _movieDetailUpdateAdapter.update(movie, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteMovie(MovieDetail movie) async {
    await _movieDetailDeletionAdapter.delete(movie);
  }
}

// ignore_for_file: unused_element
final _belongsToCollectionsConverter = BelongsToCollectionsConverter();
final _genreListConverter = GenreListConverter();
final _productionCompanyListConverter = ProductionCompanyListConverter();
final _spokenLanguageListConverter = SpokenLanguageListConverter();
final _stringListConverter = StringListConverter();
final _productionCountryListConverter = ProductionCountryListConverter();
