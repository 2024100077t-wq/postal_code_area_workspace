class SpaceTelemetryException implements Exception {
  final String message;
  final Object? cause;

  SpaceTelemetryException(this.message, [this.cause]);

  @override
  String toString() {
    if (cause != null) {
      return 'SpaceTelemetryException: $message '
          '(Underlying: $cause)';
    }

    return 'SpaceTelemetryException: $message';
  }
}