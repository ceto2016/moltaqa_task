import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/new_arrivals_response.dart';
import '../repositories/new_arrivals_repository.dart';

class GetNewArrivals
    extends UseCase<NewArrivalsResponse, GetNewArrivalsParams> {
  final NewArrivalsRepository repository;

  GetNewArrivals({required this.repository});

  @override
  Future<Either<Failure, NewArrivalsResponse>> call(
      GetNewArrivalsParams params) async {
    return await repository.getNewArrivals(pageNumber: params.pageNumber);
  }
}

class GetNewArrivalsParams {
  final int pageNumber;
  GetNewArrivalsParams({required this.pageNumber});
}
