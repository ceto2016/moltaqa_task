import 'package:dio/dio.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/util/api_basehelper.dart';

import '../../domain/entities/new_arrivals_response.dart';

abstract class NewArrivalsRemoteDataSource {
  Future<NewArrivalsResponse> getNewArrivals({required int pageNumber});
}

class NewArrivalsRemoteDataSourceImpl implements NewArrivalsRemoteDataSource {
  final ApiBaseHelper helper;

  NewArrivalsRemoteDataSourceImpl({required this.helper});
  @override
  Future<NewArrivalsResponse> getNewArrivals({required int pageNumber}) async {
    try {
      final response =
          await helper.get(url: "$getNewArrivalsAPI?page=$pageNumber");
      return NewArrivalsResponse.fromMap(response);
    } on DioError catch (e) {
      if (e is ServerException) {
        rethrow;
      } else {
        throw ServerException(message: e.message);
      }
    }
  }
}
