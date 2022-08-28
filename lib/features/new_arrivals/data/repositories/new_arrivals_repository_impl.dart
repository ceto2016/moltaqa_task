import '../../../../core/error/exceptions.dart';
import '../../domain/entities/new_arrivals_response.dart';
import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/new_arrivals_repository.dart';

import '../datasources/new_arrivals_remote_datasource.dart';

class NewArrivalsRepositoryImpl implements NewArrivalsRepository {
  final NewArrivalsRemoteDataSource remote;

  NewArrivalsRepositoryImpl({required this.remote});
  @override
  Future<Either<Failure, NewArrivalsResponse>> getNewArrivals(
      {required int pageNumber}) async {
    try {
      return Right(await remote.getNewArrivals(pageNumber: pageNumber));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message ?? ''));
    }
  }
}
