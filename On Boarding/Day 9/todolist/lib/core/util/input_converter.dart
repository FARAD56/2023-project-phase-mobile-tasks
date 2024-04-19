import 'package:dartz/dartz.dart';
import 'package:todolist/core/error/failures.dart';

class InputConverter {
  Either<Failure, int> stringToUnsignedInteger(String str) {
    try {
      int integer = int.parse(str);
      if (integer <= 0) throw const FormatException();
      return Right(integer);
    } on FormatException {
      return const Left(InvalidInputFailure(message: 'Invalid Input'));
    }
  }
}

class InvalidInputFailure extends Failure {
  const InvalidInputFailure({required super.message});
}
