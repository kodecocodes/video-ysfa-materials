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

class Constants {
  // Values from the RW API
  static const String iosDomain = "1";
  static const String androidDomain = "2";
  static const String unityDomain = "3";
  static const String macosDomain = "5";
  static const String archivedDomain = "6";
  static const String sssDomain = "8";
  static const String flutterDomain = "9";

  // Values stored in preferences
  static const int iosFilter = 1;
  static const int androidFilter = 2;
  static const int flutterFilter = 9;
  static const int sssFilter = 8;
  static const int unityFilter = 3;
  static const int macosFilter = 5;
  static const int allFilter = 0;
  static const int otherFilter = -1;

  static const String filterKey = "FILTER_KEY";
}
