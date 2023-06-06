import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:neirodev/core/network/dio_exceptions.dart';
import 'package:neirodev/core/network/dio_helper.dart';
import 'package:neirodev/screens/age/data/repository/age_repository.dart';
import 'package:neirodev/screens/gender/data/model/gender_model.dart';
import 'package:http/http.dart' as http;

abstract class GenderRepository {
  Future<ResponseFromRequest> getGenderByName(String name);
  Future<ResponseFromRequest> getGenderByNameWithHTTP(String name);
}

class GenderRepositoryImpl implements GenderRepository {
  @override
  Future<ResponseFromRequest> getGenderByName(String name) async {
    try {
      final genderResponse = await API().dio.get('genderize.io/?name=$name');
      log('ageResponse: ${genderResponse.statusCode} & ${genderResponse.data}');
      return ResponseFromRequest(response: GenderModel.fromJson(genderResponse.data));
    } on DioError catch (error) {
      final errorMessage = DioExceptions.fromDioError(error);
      log('GenderRepository DioError: $errorMessage');
      return ResponseFromRequest(errorMessage: errorMessage);
    } catch (error) {
      log('GenderRepository error: ${error.toString()}');
      return ResponseFromRequest(errorMessage: error.toString());
    }
  }

  @override
  Future<ResponseFromRequest> getGenderByNameWithHTTP(String name) async{
    final ageResponse =
        await http.get(Uri.parse('https://api.genderize.io/?name=$name'));

    if (ageResponse.statusCode == 200) {
      return ResponseFromRequest(
          response: GenderModel.fromJson(jsonDecode(ageResponse.body)));
    } else {
      return ResponseFromRequest(
          errorMessage: DioExceptions.handleError(ageResponse.statusCode));
    }
  }
}
