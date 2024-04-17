import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/mockito.dart';
import 'package:todolist/core/network/network_info.dart';

class MockDataConnectionChecker extends Mock
    implements InternetConnectionChecker {}

void main() {
  MockDataConnectionChecker mockDataConnectionChecker;
  NetworkInfoImpl networkInfo;

  mockDataConnectionChecker = MockDataConnectionChecker();
  networkInfo = NetworkInfoImpl(connectionChecker: mockDataConnectionChecker);

  group('Is connected', () {
    test('connection Test', () async {
      when(mockDataConnectionChecker.hasConnection)
          .thenAnswer((_) async => true);

      final result = await networkInfo.isConnected;
      verify(mockDataConnectionChecker.hasConnection);
      expect(result,true);
    });
  });
}
