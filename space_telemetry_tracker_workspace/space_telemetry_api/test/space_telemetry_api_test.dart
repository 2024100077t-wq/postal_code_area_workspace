import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:space_telemetry_api/space_telemetry_api.dart';
import 'package:test/test.dart';

class MockHttpClient extends http.BaseClient {
  final http.Response response;

  MockHttpClient(this.response);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    return http.StreamedResponse(
      Stream.value(utf8.encode(response.body)),
      response.statusCode,
      headers: response.headers,
      request: request,
    );
  }
}

void main() {
  group('SpaceTelemetry', () {
    test('creates a telemetry object from valid JSON', () {
      final telemetry = SpaceTelemetry.fromJson({
        'id': 'TEST-001',
        'name': 'Test Satellite',
        'value': 123.45,
      });

      expect(telemetry.id, 'TEST-001');
      expect(telemetry.name, 'Test Satellite');
      expect(telemetry.primaryValue, 123.45);
    });

    test('throws an exception for invalid JSON', () {
      expect(
        () => SpaceTelemetry.fromJson({
          'invalid': 'data',
        }),
        throwsA(isA<SpaceTelemetryException>()),
      );
    });
  });

  group('SpaceTelemetryClient', () {
    test('gets telemetry from the API', () async {
      final mockResponse = http.Response(
        jsonEncode([
          {
            'messageID': 'TEST-001',
            'messageType': 'Test Satellite',
          },
        ]),
        200,
      );

      final client = SpaceTelemetryClient(
        httpClient: MockHttpClient(mockResponse),
      );

      final telemetry = await client.getTelemetry();

      expect(telemetry.id, 'TEST-001');
      expect(telemetry.name, 'Test Satellite');
      expect(telemetry.primaryValue, 0);
    });
  });
}