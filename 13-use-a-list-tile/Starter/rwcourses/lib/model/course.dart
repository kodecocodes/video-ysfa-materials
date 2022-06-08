import 'domain.dart';
import '../constants.dart';

class Course {
  final String courseId;
  final String name;
  final String description;
  final String artworkUrl;
  final String difficulty;
  final String contributors;
  final List<Domain> domains;

  Course(this.courseId, this.name, this.description, this.artworkUrl,
      this.difficulty, this.contributors, this.domains);

  Course.fromJson(Map<String, dynamic> json)
      : courseId = json['id'] as String,
        name = json['attributes']['name'] as String,
        description = json['attributes']['description_plain_text'] as String,
        artworkUrl = json['attributes']['card_artwork_url'] as String,
        difficulty = json['attributes']['difficulty'] as String,
        contributors = json['attributes']['contributor_string'] as String,
        domains = [] {
    final domainData =
        json['relationships']['domains']['data'] as List<dynamic>;
    if (domainData.length > 0) {
      for (var i = 0; i < domainData.length; i++) {
        final domain = Course.getDomain(
            json['relationships']['domains']['data'][i]['id'] as String);
        domains.add(domain);
      }
    }
  }

  static Domain getDomain(String domainId) {
    switch (domainId) {
      case Constants.iosDomain:
        return Domain.ios;
      case Constants.androidDomain:
        return Domain.android;
      case Constants.unityDomain:
        return Domain.unity;
      case Constants.sssDomain:
        return Domain.sss;
      case Constants.flutterDomain:
        return Domain.flutter;
      case Constants.macosDomain:
        return Domain.macos;
      case Constants.archivedDomain:
        return Domain.archived;
      default:
        return Domain.unknown;
    }
  }

  String get domainString {
    var result = '';
    for (var i = 0; i < domains.length - 1; i++) {
      result += domains[i].name + ', ';
    }
    result += domains.last.name;
    return result;
  }

  @override
  String toString() {
    return name + ': ' + domainString;
  }
}
