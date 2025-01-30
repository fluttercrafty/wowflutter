import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class DateTimeHelper {
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

  static String formatDate(String dateString) {
    DateTime inputDate =
        DateTime.parse(dateString); // Convert String to DateTime
    DateTime now = DateTime.now();
    DateTime yesterday = now.subtract(const Duration(days: 1));

    // Format for Today (Only time e.g., 10:47 AM)
    if (inputDate.year == now.year &&
        inputDate.month == now.month &&
        inputDate.day == now.day) {
      return DateFormat('hh:mm a').format(inputDate);
    }

    // Format for Yesterday
    if (inputDate.year == yesterday.year &&
        inputDate.month == yesterday.month &&
        inputDate.day == yesterday.day) {
      return 'Yesterday';
    }

    // Format for any other date (e.g., 28 Jan 2025)
    return DateFormat('dd MMM yyyy').format(inputDate);
  }

  static String convertTime(String timestamp) {
    // Parse the UNIX timestamp
    int parsedTimestamp = int.tryParse(timestamp) ?? 0;
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(parsedTimestamp * 1000);

    // Format the time as "hh:mm a"
    return DateFormat('hh:mm a').format(dateTime);
  }

  static String convertAgo(String timestamp) {
    try {
      int parsedTimestamp = int.tryParse(timestamp) ?? 0;
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
          parsedTimestamp * 1000,
          isUtc: true);
      DateTime localDateTime = dateTime.toLocal();
      return timeago.format(localDateTime, locale: 'en_short');
    } catch (e) {
      return "Invalid timestamp";
    }
  }

  static bool shouldShowBadge(String unixTime) {
    try {
      int timestamp = int.tryParse(unixTime) ?? 0;
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
        timestamp * 1000,
        isUtc: true,
      ).toLocal();
      final now = DateTime.now();
      final difference = now.difference(dateTime);
      return difference.inDays < 7;
    } catch (e) {
      return false;
    }
  }
}
