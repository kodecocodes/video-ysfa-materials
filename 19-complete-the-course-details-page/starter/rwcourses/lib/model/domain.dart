import '../strings.dart';

enum Domain { all, ios, android, flutter, sss, unity, macos, archived, unknown }

extension DomainExtension on Domain {
  String get name {
    switch (this) {
      case Domain.ios:
        return Strings.ios;
      case Domain.android:
        return Strings.android;
      case Domain.unity:
        return Strings.unity;
      case Domain.sss:
        return Strings.sss;
      case Domain.flutter:
        return Strings.flutter;
      case Domain.macos:
        return Strings.macos;
      case Domain.archived:
      default:
        return Strings.unknown;
    }
  }
}
