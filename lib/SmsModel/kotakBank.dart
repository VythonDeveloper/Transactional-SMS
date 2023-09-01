import 'dart:math';
import 'package:intl/intl.dart';

class KotakBank {
  Random random = new Random();
  // Kotak Bank Variables
  int account = 1000; //4 digit
  double balance = 30000;
  List address = ['JM-KOTAKB'];
  List serviceNumbers = [
    '+911725199998',
    '+917012075009',
    '+919442499994',
    '+917011075093'
  ];
  String creditSms =
      "High five! Payment of INR 30000 is credited to your Kotak Bank Credit Card x4603 on 18-JUL-2023 . Available Credit limit is INR 50009.2.";

  KotakBank() {
    account = 1000 + random.nextInt(10000 - 1000);
    balance = random.nextDouble() * 8000;
  }

  Map<String, dynamic> generateSms(
      {required String txnType, required int millisecond}) {
    String smsBody = '';
    DateTime txnDate = DateTime.fromMillisecondsSinceEpoch(millisecond);
    String formatTxnDate = DateFormat('dd-MMM-yyyy').format(txnDate);

    int amount = 50 + random.nextInt(4300 - 50);
    balance = balance + amount;
    smsBody = "High five! Payment of INR " +
        amount.toStringAsFixed(0) +
        " is credited to your Kotak Bank Credit Card x" +
        account.toString() +
        " on " +
        formatTxnDate +
        " . Available Credit limit is INR " +
        balance.toStringAsFixed(1) +
        ".";

    return {
      "_protocol": "0",
      "_address": address[random.nextInt(address.length)],
      "_date": millisecond.toString(),
      "_type": "1",
      "_subject": "null",
      "_body": smsBody,
      "_toa": "null",
      "_sc_toa": "null",
      "_service_center": serviceNumbers[random.nextInt(serviceNumbers.length)],
      "_read": "0",
      "_status": "0",
      "_locked": "0",
      "_date_sent": millisecond.toString(),
      "_sub_id": "3",
      "_readable_date": DateFormat.yMMMd()
          .add_jms()
          .format(DateTime.fromMillisecondsSinceEpoch(millisecond)),
      "_contact_name": "(Unknown)"
    };
  }
}
