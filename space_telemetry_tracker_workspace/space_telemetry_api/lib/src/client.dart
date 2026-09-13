import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models.dart';

class SpaceTelemetryClient {
  final http.Client _httpClient;

  SpaceTelemetryClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  Future<SpaceTelemetry> getTelemetry() async {
    try {
      final response = await _httpClient.get(
        Uri.parse(
          'https://api.nasa.gov/DONKI/notifications?api_key=DEMO_KEY',
        ),
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        if (json is List && json.isNotEmpty) {
          final item = json.first as Map<String, dynamic>;

          return SpaceTelemetry.fromJson({
            'id': item['messageID'] ?? 'UNKNOWN',
            'name': item['messageType'] ?? 'Unknown Telemetry',
            'value': 0,
          });
        }
      }

      // Fallback telemetry kapag unavailable ang NASA API.
      return SpaceTelemetry.fromJson({
        'id': 'LOCAL-001',
        'name': 'Fallback Telemetry',
        'value': 0,
      });
    } catch (_) {
      // Fallback kapag walang internet o unavailable ang API.
      return SpaceTelemetry.fromJson({
        'id': 'LOCAL-001',
        'name': 'Fallback Telemetry',
        'value': 0,
      });
    }
  }
}