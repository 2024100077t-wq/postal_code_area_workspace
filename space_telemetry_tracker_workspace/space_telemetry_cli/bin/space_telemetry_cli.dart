import 'package:space_telemetry_api/space_telemetry_api.dart';
import 'package:terminal_colors/terminal_colors.dart';

void main(List<String> arguments) async {
  try {
    final client = SpaceTelemetryClient();

    final telemetry = await client.getTelemetry();

    print('--- SPACE TELEMETRY ---'.styleHeader);
    print('ID: ${telemetry.id}'.styleSuccess);
    print('Name: ${telemetry.name}');
    print('Primary Value: ${telemetry.primaryValue}');
  } catch (e) {
    print('Error: $e'.styleError);
  }
}