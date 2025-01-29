

import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:mentali/movieapp/core/resources/resources.dart';
import 'package:retrofit/retrofit.dart';

Future<bool> isNetworkConnected() async {
  var connectionResult = await Connectivity().checkConnectivity();
  return connectionResult != ConnectivityResult.none;
}


String getUserFriendlyErrorMessage(dynamic error) {
  if (error is DioException) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return 'The request timed out. Please check your internet connection and try again.';
      case DioExceptionType.badResponse:
        if (error.response?.statusCode == 404) {
          return 'The requested resource was not found.';
        } else if (error.response?.statusCode == 500) {
          return 'Something went wrong on the server. Please try again later.';
        } else {
          return 'An error occurred while processing your request.';
        }
      case DioExceptionType.cancel:
        return 'The request was cancelled.';
      case DioExceptionType.unknown:
        return 'An unknown error occurred. Please try again.';
      default:
        return 'No internet connection. Please check your network settings.';
    }
  } else if (error is SocketException) {
    return 'No internet connection. Please check your network settings.';
  } else {
    return 'An unexpected error occurred. Please try again.';
  }
}