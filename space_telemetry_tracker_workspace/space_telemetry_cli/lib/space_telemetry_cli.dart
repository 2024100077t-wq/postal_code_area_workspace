import 'package:space_telemetry_api/space_telemetry_api.dart';

Future<void> main() async {
  final client = SpaceTelemetryClient();

  try {
    final telemetry = await client.getTelemetry();

    print('--- SPACE TELEMETRY ---');
    print('ID: ${telemetry.id}');
    print('Name: ${telemetry.name}');
    print('Primary Value: ${telemetry.primaryValue}');
  } catch (e) {
    print('Error: $e');
  }
}