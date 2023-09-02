import 'dart:math';
import 'package:intl/intl.dart';

class CentralBank {
  Random random = new Random();
  // Central Bank Variables
  int account = 1000; //4 digit
  double balance = 500;
  List address = ['AD-CENTBK', 'VM-CENTBK'];
  List serviceNumbers = [
    '+911725199998',
    '+917012075009',
    '+919442499994',
    '+917011075093'
  ];
  String debitSms =
      "A/c 3XXXXX8678 debited by Rs. 23173 Total Bal: Rs.  22022.71 CR Clr Bal: Rs. 22022.71 CR. Call 1800221911 if txn not done by you to block account/card.-CBoI";
  String creditSms =
      "A/c 3XXXXX3416 credited by Rs. 18753 Total Bal: Rs.  22861.00 CR Clr Bal: Rs. 22861.00 CR. Never share OTP/Password for EMI postponement or any reason.-CBoI";

  CentralBank() {
    account = 1000 + random.nextInt(10000 - 1000);
    balance = random.nextDouble() * 8000;
  }

  Map<String, dynamic> generateSms(
      {required String txnType, required int millisecond}) {
    String smsBody = '';

    if (txnType.toLowerCase() == 'debit') {
      int amount = 50 + random.nextInt(5100 - 50);
      if (amount < balance) {
        balance = balance - amount;
        smsBody = "A/c 3XXXXX" +
            account.toString() +
            " debited by Rs. " +
            amount.toStringAsFixed(2) +
            " Total Bal: Rs.  " +
            balance.toStringAsFixed(2) +
            " CR Clr Bal: Rs. " +
            balance.toStringAsFixed(2) +
            " CR. Call 1800221911 if txn not done by you to block account/card.-CBoI";
      } else {
        txnType = 'credit';
      }
    }

    if (txnType.toLowerCase() == "credit") {
      int amount = 50 + random.nextInt(4300 - 50);
      balance = balance + amount;
      smsBody = "A/c 3XXXXX" +
          account.toString() +
          " credited by Rs. " +
          amount.toStringAsFixed(2) +
          " Total Bal: Rs.  " +
          balance.toStringAsFixed(2) +
          " CR Clr Bal: Rs. " +
          balance.toStringAsFixed(2) +
          " CR. Never share OTP/Password for EMI postponement or any reason.-CBoI";
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
