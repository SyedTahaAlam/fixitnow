import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Android variants do not request internet access', () {
    final manifests = Directory('android/app/src')
        .listSync(recursive: true)
        .whereType<File>()
        .where((file) => file.path.endsWith('AndroidManifest.xml'));
    expect(manifests, isNotEmpty);
    for (final manifest in manifests) {
      expect(
        manifest.readAsStringSync(),
        isNot(contains('android.permission.INTERNET')),
        reason: manifest.path,
      );
    }
  });

  test('Runtime Dart source has no network clients or remote assets', () {
    final forbidden = RegExp(
      r'''https?://|Image\.network|NetworkImage|dart:io|dart:html|package:(http|dio|firebase)[/'"]''',
    );
    for (final source in Directory(
      'lib',
    ).listSync(recursive: true).whereType<File>()) {
      if (!source.path.endsWith('.dart')) continue;
      expect(
        forbidden.hasMatch(source.readAsStringSync()),
        isFalse,
        reason: '${source.path} must remain offline',
      );
    }
  });
}
