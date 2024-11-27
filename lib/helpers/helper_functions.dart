import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:html/parser.dart' as html_parser;
import 'package:wowflutter/colors/colors.dart';

class THelper {
  static Color? getColor(String value) {
    /// Define your product specific colors here and it will match the attribute colors and show specific 🟠🟡🟢🔵🟣🟤

    if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Red') {
      return Colors.red;
    } else if (value == 'Blue') {
      return Colors.blue;
    } else if (value == 'Pink') {
      return Colors.pink;
    } else if (value == 'Grey') {
      return Colors.grey;
    } else if (value == 'Purple') {
      return Colors.purple;
    } else if (value == 'Black') {
      return Colors.black;
    } else if (value == 'White') {
      return Colors.white;
    } else if (value == 'Yellow') {
      return Colors.yellow;
    } else if (value == 'Orange') {
      return Colors.deepOrange;
    } else if (value == 'Brown') {
      return Colors.brown;
    } else if (value == 'Teal') {
      return Colors.teal;
    } else if (value == 'Indigo') {
      return Colors.indigo;
    } else {
      return null;
    }
  }

  static String convertToTimeAgo(String input) {
    DateTime dateTime;

    try {
      if (RegExp(r'^\d+$').hasMatch(input)) {
        // Handle UNIX timestamp
        int timestamp = int.tryParse(input) ?? 0;
        dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
      } else {
        // Handle standard date string
        dateTime = DateTime.parse(input);
      }

      // Format as "time ago"
      return timeago.format(dateTime);
    } catch (e) {
      return "Invalid date";
    }
  }

  static bool boolSystem({String? key}) {
    return key == '1' || key?.toLowerCase() == 'true';
  }

  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(milliseconds: 700),
      ),
    );
  }

  static void showAlert(String? title, String message,
      {VoidCallback? onTapYes, VoidCallback? onTapNo}) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor:
              THelper.isDarkMode(Get.context!) ? TColors.black : TColors.white,
          title: Text(title!,
              style: TextStyle(
                  color: THelper.isDarkMode(Get.context!)
                      ? TColors.white
                      : TColors.black)),
          content: Text(message,
              style: TextStyle(
                  color: THelper.isDarkMode(Get.context!)
                      ? TColors.white
                      : TColors.black)),
          actions: [
            if (onTapYes != null)
              TextButton(
                onPressed: () {
                  onTapYes();
                  Navigator.of(context).pop();
                },
                child: Text('Yes',
                    style: TextStyle(
                        color: THelper.isDarkMode(Get.context!)
                            ? TColors.white
                            : TColors.black)),
              ),
            if (onTapNo != null)
              TextButton(
                onPressed: () {
                  onTapNo();
                },
                child: Text('No',
                    style: TextStyle(
                        color: THelper.isDarkMode(Get.context!)
                            ? TColors.white
                            : TColors.black)),
              ),
            if (onTapYes == null && onTapNo == null)
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK')),
          ],
        );
      },
    );
  }

  static void showCustomAlertBox(
      {VoidCallback? onTap, required String message}) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.all(20),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      if (onTap != null) onTap();
                    },
                    child: const Text(
                      'Confirm',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static String capitalize(String text) {
    List<String> words = text.split(' ');
    for (int i = 0; i < words.length; i++) {
      if (words[i].isNotEmpty) {
        words[i] = words[i][0].toUpperCase() + words[i].substring(1);
      }
    }
    return words.join(' ');
  }

  static String getFormattedDate(DateTime date,
      {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  // static void getAppDetails(String encryptedData) {
  //   final encryptionService = EncryptionService();

  //   final decryptedJson = encryptionService.decryptData(encryptedData);
  //   if (decryptedJson != null) {
  //     final decryptedData = jsonDecode(decryptedJson);
  //     data.add(decryptedData);
  //   } else {
  //     debugPrint("failed.");
  //   }
  // }

  static String convertHtmlToShort(String htmlString) {
    final document = html_parser.parse(htmlString);
    final plainText = document.body?.text ?? '';
    return plainText;
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
          i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }
}

extension StringHelperExtension on String {
  String removeDiacriticalMarks() {
    return splitMapJoin(
      '',
      onNonMatch: (char) => char.isNotEmpty && kDiacriticsString.contains(char)
          ? kNonDiacriticsString[kDiacriticsString.indexOf(char)]
          : char,
    );
  }

  String toNormalize() {
    return toLowerCase();
  }

  String removeLastWord([int amount = 1]) {
    final int cacheLenght = length;
    if (cacheLenght > amount) {
      return substring(0, cacheLenght - amount);
    } else {
      return "";
    }
  }

  String toCapitalize() {
    return isNotEmpty
        ? "${this[0].toUpperCase()}${substring(1, length).toLowerCase()}"
        : this;
  }

  String toPluralize() {
    if (isEmpty) return "";
    if (this[length - 1].toLowerCase() == "s") return this;
    return "${this}s";
  }

  String removeAllNotNumber({List<String> exclude = const []}) {
    final List<String> valid = kNumbersString.toList()..addAll(exclude);
    final StringBuffer buffer = StringBuffer();
    for (int i = 0; i < length; i++) {
      final String character = this[i];
      if (valid.contains(character)) buffer.write(character);
    }
    return buffer.toString();
  }

  String censorEmail({int begin = 4, int end = 4, int asterisks = 4}) {
    final int count = length;
    final StringBuffer censor = StringBuffer();
    asterisks.forEach((_) => censor.write("*"));

    if (count >= begin + end) {
      return "${substring(0, begin)}$censor${substring(count - end, count)}";
    }
    return this;
  }

  String removeAllNumbers({List<String> include = const []}) {
    final List<String> invalid = kNumbersString.toList()..addAll(include);
    final StringBuffer buffer = StringBuffer();
    for (int i = 0; i < length; i++) {
      final String character = this[i];
      if (!invalid.contains(character)) buffer.write(character);
    }
    return buffer.toString();
  }
}

const kNumbersString = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];
const String kDiacriticsString =
    'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
const String kNonDiacriticsString =
    'AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz';

extension IntExtensionHelper on int {
  void forEach(void Function(int index) f) {
    for (var i = 0; i < this; i++) {
      f(i);
    }
  }

  List<T> map<T>(T Function(int index) f) {
    final List<T> values = [];
    for (var i = 0; i < this; i++) {
      values.add(f(i));
    }
    return values;
  }
}
