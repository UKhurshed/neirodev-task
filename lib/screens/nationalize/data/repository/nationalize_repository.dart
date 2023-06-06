import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:neirodev/core/network/dio_exceptions.dart';
import 'package:neirodev/core/network/dio_helper.dart';
import 'package:neirodev/screens/age/data/repository/age_repository.dart';
import 'package:neirodev/screens/nationalize/data/model/nationalize_model.dart';

abstract class NationalizeRepository {
  Future<ResponseFromRequest> getNationalizeByName(String name);
}

class NationalizeRepositoryImpl implements NationalizeRepository {
  @override
  Future<ResponseFromRequest> getNationalizeByName(String name) async {
    try {
      final nationalizeResponse = await API().dio.get('nationalize.io/?name=$name');
      log('ageResponse: ${nationalizeResponse.statusCode} & ${nationalizeResponse.data}');
      return ResponseFromRequest(response: NationalizeModel.fromJson(nationalizeResponse.data));
    } on DioError catch (error) {
      final errorMessage = DioExceptions.fromDioError(error);
      log('NationalizeRepository DioError: $errorMessage');
      return ResponseFromRequest(errorMessage: errorMessage);
    } catch (error) {
      log('NationalizeRepository error: ${error.toString()}');
      return ResponseFromRequest(errorMessage: error.toString());
    }
  }
}
