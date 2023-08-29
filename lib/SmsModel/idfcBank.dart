import 'dart:math';
import 'package:intl/intl.dart';

class IDFCBank {
  Random random = new Random();
  // IDFC Bank Variables
  int account = 100000; //6 digit
  double balance = 30000;
  List address = ['VD-IDFCFB', 'VM-IDFCFB'];
  List serviceNumbers = [
    '+911725199998',
    '+917012075009',
    '+919442499994',
    '+917011075093'
  ];
  String debitSms =
      "[VD-IDFCFB] Your A/C XXXXX301198 is debited by INR 10.00 on 18/07/23 09:05. New Bal :INR 137.00. Call us on 180010888 for dispute. Team IDFC FIRST Bank";
  String creditSms =
      "[VM-IDFCFB] Your A/C XXXXX301198 is credited with INR 10.00 on 18/07/23 09:01. Your new balance is INR 147.00. Team IDFC FIRST Bank";

  IDFCBank() {
    account = 100000 + random.nextInt(1000000 - 100000);
    balance = random.nextDouble() * 30000;
  }

  Map<String, dynamic> generateSms(
      {required String txnType, required int millisecond}) {
    String smsBody = '';
    DateTime txnDate = DateTime.fromMillisecondsSinceEpoch(millisecond);
    String formatTxnDate = txnDate.day.toString().padLeft(2, '0') +
        "/" +
        txnDate.month.toString().padLeft(2, '0') +
        "/" +
        txnDate.year.toString() +
        " " +
        txnDate.hour.toString().padLeft(2, '0') +
        ":" +
        txnDate.minute.toString().padLeft(2, '0');

    if (txnType.toLowerCase() == 'debit') {
      int amount = 100 + random.nextInt(10000 - 100);
      if (amount < balance) {
        balance = balance - amount;
        smsBody = "Your A/C XXXXX" +
            account.toString() +
            " is debited by INR " +
            amount.toStringAsFixed(2) +
            " on " +
            formatTxnDate +
            ". New Bal :INR " +
            balance.toStringAsFixed(2) +
            ". Call us on 180010888 for dispute. Team IDFC FIRST Bank";
      } else {
        txnType = 'credit';
      }
    }

    if (txnType.toLowerCase() == "credit") {
      int amount = 1000 + random.nextInt(10000 - 1000);
      balance = balance + amount;
      smsBody = "Your A/C XXXXX" +
          account.toString() +
          " is credited with INR " +
          amount.toStringAsFixed(2) +
          " on " +
          formatTxnDate +
          ". Your new balance is INR " +
          balance.toStringAsFixed(2) +
          ". Team IDFC FIRST Bank";
    }

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
