
import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:mentali/movieapp/data/models/movie_detail.dart';

class BelongsToCollectionsConverter extends TypeConverter<BelongsToCollection?, String?>{
  @override
  BelongsToCollection? decode(String? databaseValue) {
    return databaseValue == null ? null : BelongsToCollection.fromJson(jsonDecode(databaseValue));
  }

  @override
  String? encode(BelongsToCollection? value) {
    return value == null ? null : jsonEncode(value.toJson());
  }
}

// TypeConverter for List<Genre>
class GenreListConverter extends TypeConverter<List<Genre>?, String?> {
  @override
  List<Genre>? decode(String? databaseValue) {
    if (databaseValue == null) return null;
    final List<dynamic> jsonList = jsonDecode(databaseValue);
    return jsonList.map((json) => Genre.fromJson(json)).toList();
  }

  @override
  String? encode(List<Genre>? value) {
    if (value == null) return null;
    return jsonEncode(value.map((genre) => genre.toJson()).toList());
  }
}

// TypeConverter for List<ProductionCompany>
class ProductionCompanyListConverter extends TypeConverter<List<ProductionCompany>?, String?> {
  @override
  List<ProductionCompany>? decode(String? databaseValue) {
    if (databaseValue == null) return null;
    final List<dynamic> jsonList = jsonDecode(databaseValue);
    return jsonList.map((json) => ProductionCompany.fromJson(json)).toList();
  }

  @override
  String? encode(List<ProductionCompany>? value) {
    if (value == null) return null;
    return jsonEncode(value.map((company) => company.toJson()).toList());
  }
}

// TypeConverter for List<ProductionCountry>
class ProductionCountryListConverter extends TypeConverter<List<ProductionCountry>?, String?> {
  @override
  List<ProductionCountry>? decode(String? databaseValue) {
    if (databaseValue == null) return null;
    final List<dynamic> jsonList = jsonDecode(databaseValue);
    return jsonList.map((json) => ProductionCountry.fromJson(json)).toList();
  }

  @override
  String? encode(List<ProductionCountry>? value) {
    if (value == null) return null;
    return jsonEncode(value.map((country) => country.toJson()).toList());
  }
}

// TypeConverter for List<SpokenLanguage>
class SpokenLanguageListConverter extends TypeConverter<List<SpokenLanguage>?, String?> {
  @override
  List<SpokenLanguage>? decode(String? databaseValue) {
    if (databaseValue == null) return null;
    final List<dynamic> jsonList = jsonDecode(databaseValue);
    return jsonList.map((json) => SpokenLanguage.fromJson(json)).toList();
  }

  @override
  String? encode(List<SpokenLanguage>? value) {
    if (value == null) return null;
    return jsonEncode(value.map((language) => language.toJson()).toList());
  }
}

class StringListConverter extends TypeConverter<List<String>?, String?> {
  @override
  List<String>? decode(String? databaseValue) {
    if (databaseValue == null) return null;
    return List<String>.from(jsonDecode(databaseValue));
  }

  @override
  String? encode(List<String>? value) {
    if (value == null) return null;
    return jsonEncode(value);
  }
}