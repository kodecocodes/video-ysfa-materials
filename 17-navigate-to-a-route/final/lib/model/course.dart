//  Copyright (c) 2020 Razeware LLC
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
//  distribute, sublicense, create a derivative work, and/or sell copies of the
//  Software in any work that is designed, intended, or marketed for pedagogical or
//  instructional purposes related to programming, coding, application development,
//  or information technology.  Permission for such use, copying, modification,
//  merger, publication, distribution, sublicensing, creation of derivative works,
//  or sale is expressly withheld.
//
//  This project and source code may use libraries or frameworks that are
//  released under various Open-Source licenses. Use of those libraries and
//  frameworks are governed by their own individual licenses.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import 'package:rwcourses/constants.dart';
import 'package:rwcourses/model/domain.dart';

class Course {
  final String courseId;
  final String name;
  final String description;
  final String artworkUrl;
  final String difficulty;
  final String contributors;
  final List<Domain> domains;

  Course(
    this.courseId,
    this.name,
    this.description,
    this.artworkUrl,
    this.difficulty,
    this.contributors,
    this.domains,
  );

  Course.fromJson(Map<String, dynamic> json)
      : courseId = json["id"],
        name = json["attributes"]["name"],
        description = json["attributes"]["description_plain_text"],
        artworkUrl = json["attributes"]["card_artwork_url"],
        difficulty = json["attributes"]["difficulty"],
        contributors = json["attributes"]["contributor_string"],
        this.domains = [] {
    var domainData = json["relationships"]["domains"]["data"] as List<dynamic>;
    if (domainData != null && domainData.length > 0) {
      for (var i = 0; i < domainData.length; i++) {
        var domain =
            Course.getDomain(json["relationships"]["domains"]["data"][i]["id"]);
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

  get domainsString {
    String result = "";
    for (var i = 0; i < domains.length - 1; i++) {
      result += domains[i].name + ", ";
    }
    result += domains.last.name;
    return result;
  }

  @override
  String toString() {
    return name + ": " + domainsString;
  }
}
