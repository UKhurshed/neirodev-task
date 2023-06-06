import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:neirodev/core/network/dio_exceptions.dart';
import 'package:neirodev/core/network/dio_helper.dart';
import 'package:neirodev/screens/age/data/model/age_model.dart';
import 'package:http/http.dart' as http;

abstract class AgeRepository {
  Future<ResponseFromRequest> getAgeByName(String name);

  Future<ResponseFromRequest> getAgeByNameWithHTTP(String name);
}

class AgeRepositoryImpl implements AgeRepository {
  @override
  Future<ResponseFromRequest> getAgeByName(String name) async {
    try {
      final ageResponse = await API().dio.get('agify.io/?name=$name');
      log('ageResponse: ${ageResponse.statusCode} & ${ageResponse.data}');
      return ResponseFromRequest(response: AgeModel.fromJson(ageResponse.data));
    } on DioError catch (error) {
      final errorMessage = DioExceptions.fromDioError(error);
      log('AgeRepository DioError: $errorMessage');
      return ResponseFromRequest(errorMessage: errorMessage);
    } catch (error) {
      log('AgeRepository error: ${error.toString()}');
      return ResponseFromRequest(errorMessage: error.toString());
    }
  }

  @override
  Future<ResponseFromRequest> getAgeByNameWithHTTP(String name) async {
    final ageResponse =
        await http.get(Uri.parse('https://api.agify.io/?name=$name'));

    if (ageResponse.statusCode == 200) {
      return ResponseFromRequest(
          response: AgeModel.fromJson(jsonDecode(ageResponse.body)));
    } else {
      return ResponseFromRequest(
          errorMessage: DioExceptions.handleError(ageResponse.statusCode));
    }
  }
}

class ResponseFromRequest {
  final dynamic response;
  final String? errorMessage;

  ResponseFromRequest({this.response, this.errorMessage});
}
