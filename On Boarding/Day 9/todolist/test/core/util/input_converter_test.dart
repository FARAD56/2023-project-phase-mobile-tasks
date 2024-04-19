import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todolist/core/util/input_converter.dart';

void main() {
  InputConverter inputConverter = InputConverter();

  group('String to Unsigned Int', () {

    test('return an int when the input string is an unsigned int', () {
      const str = '123';
      final result = inputConverter.stringToUnsignedInteger(str);

      expect(result, const Right(123));
    });

    test('return an int when the input string is an unsigned int', () {
      const str = '-123';
      final result = inputConverter.stringToUnsignedInteger(str);

      expect(result, const Left(InvalidInputFailure(message: 'Invalid Input')));
    });
  });

}
