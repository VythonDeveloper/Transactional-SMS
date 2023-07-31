import 'dart:math';
import 'package:intl/intl.dart';

class CsfBank {
  Random random = new Random();
  // Csf Bank Variables
  int accountSuffix = 100; //3 digit
  int accountPrefix = 1000; //4 digit
  double balance = 50000;
  List address = ['AX-CSFBNK'];
  List serviceNumbers = [
    '+911725199998',
    '+917012075009',
    '+919442499994',
    '+917011075093'
  ];
  String debitSms =
      "Your A/c 071XXXXX2178 is debited by INR 197.00 on 09-MAR-2023. Info: Transfer. Total Avbl. Bal is INR 1886.61. CSF Bank";

  CsfBank() {
    accountSuffix = 100 + random.nextInt(1000 - 100);
    accountPrefix = 1000 + random.nextInt(10000 - 1000);
    balance = random.nextDouble() * 50000;
  }

  Map<String, dynamic> generateSms(
      {required String txnType, required int millisecond}) {
    String smsBody = '';
    DateTime txnDate = DateTime.fromMillisecondsSinceEpoch(millisecond);
    String formatTxnDate = DateFormat('dd-MMM-yyyy').format(txnDate);

    if (txnType.toLowerCase() == 'debit') {
      int amount = 100 + random.nextInt(10000 - 100);
      if (amount < balance) {
        balance = balance - amount;
        smsBody = "Your A/c " +
            accountSuffix.toString() +
            "XXXXX" +
            accountPrefix.toString() +
            " is debited by INR " +
            amount.toStringAsFixed(2) +
            " on " +
            formatTxnDate +
            ". Info: Transfer. Total Avbl. Bal is INR " +
            balance.toStringAsFixed(2) +
            ". CSF Bank";
      } else {
        txnType = 'credit';
      }
    }

    if (txnType.toLowerCase() == "credit") {
      int amount = 1000 + random.nextInt(10000 - 1000);
      balance = balance + amount;
      smsBody = "Your A/c " +
          accountSuffix.toString() +
          "XXXXX" +
          accountPrefix.toString() +
          " is credited by INR " +
          amount.toStringAsFixed(2) +
          " on " +
          formatTxnDate +
          ". Info: Transfer. Total Avbl. Bal is INR " +
          balance.toStringAsFixed(2) +
          ". CSF Bank";
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
