import 'package:terminal_colors/terminal_colors.dart';
import 'package:test/test.dart';

void main() {
  group('Colorizer', () {
    test('adds a terminal color', () {
      final result = 'Hello'.color(TerminalColor.cyan);

      expect(result, contains(TerminalColor.cyan.code));
      expect(result, contains('Hello'));
      expect(result, contains(TerminalColor.reset.code));
    });

    test('styles header', () {
      final result = 'SPACE TELEMETRY'.styleHeader;

      expect(result, contains('SPACE TELEMETRY'));
      expect(result, contains(TerminalColor.bold.code));
      expect(result, contains(TerminalColor.cyan.code));
    });

    test('styles success message', () {
      final result = 'Success'.styleSuccess;

      expect(result, contains(TerminalColor.emerald.code));
      expect(result, contains('Success'));
    });

    test('styles warning message', () {
      final result = 'Warning'.styleWarning;

      expect(result, contains(TerminalColor.amber.code));
      expect(result, contains('Warning'));
    });

    test('styles error message', () {
      final result = 'Error'.styleError;

      expect(result, contains(TerminalColor.crimson.code));
      expect(result, contains('Error'));
    });
  });
}