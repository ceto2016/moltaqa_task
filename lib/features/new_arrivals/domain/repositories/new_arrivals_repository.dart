import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/new_arrivals_response.dart';

abstract class NewArrivalsRepository {
  Future<Either<Failure, NewArrivalsResponse>> getNewArrivals(
      {required int pageNumber});
}
