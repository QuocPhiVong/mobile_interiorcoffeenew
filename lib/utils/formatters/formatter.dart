import 'package:intl/intl.dart';

class TFormatter{

  //date formatter
  static String formatDaate(DateTime? date){
    date ??= DateTime.now();
    return DateFormat('dd-MM-yyyy').format(date); //custom the date to day - month - year
  }

  //currency formatter vnd
  static String formatCurrencyVND(double amount){
    return NumberFormat.currency(locale: 'vi_VN', symbol: 'VND').format(amount);
  }

  //currency formatter usd
  static String formatCurrencyUSD(double amount){
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  }

  //phone number formatter
  static String formatPhoneNumber(String phoneNumber){
    //day sdt co 10 so
    if(phoneNumber.length == 10){
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 11) { 
      return '(${phoneNumber.substring(0, 4)}) ${phoneNumber.substring(4, 7)} ${phoneNumber.substring(7)}';
    }

    return phoneNumber;
  }

  //
}