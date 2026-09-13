import 'exceptions.dart';

class SpaceTelemetry {
  final String id;
  final String name;
  final double primaryValue;

  SpaceTelemetry({
    required this.id,
    required this.name,
    required this.primaryValue,
  });

  factory SpaceTelemetry.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': String parsedId,
        'name': String parsedName,
        'value': num numericValue,
      } =>
        SpaceTelemetry(
          id: parsedId,
          name: parsedName,
          primaryValue: numericValue.toDouble(),
        ),

      _ => throw SpaceTelemetryException(
          'Payload failed pattern validation check!',
        ),
    };
  }
}