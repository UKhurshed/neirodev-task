import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:neirodev/core/network/dio_exceptions.dart';
import 'package:neirodev/core/network/dio_helper.dart';
import 'package:neirodev/screens/age/data/repository/age_repository.dart';
import 'package:neirodev/screens/gender/data/model/gender_model.dart';

abstract class GenderRepository {
  Future<ResponseFromRequest> getGenderByName(String name);
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
}
