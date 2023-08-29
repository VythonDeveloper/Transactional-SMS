import 'dart:math';
import 'package:intl/intl.dart';

class PaytmBank {
  Random random = new Random();
  // Paytm Bank Variables
  int account = 1000; //4 digit
  double balance = 30000;
  List address = ['VW-PAYTMB', 'BZ-PAYTMB'];
  List serviceNumbers = ['+911725199998', '+917012075009'];
  String debitSms =
      "Rs.1.00 sent to appolaau@ybl from PPBL a/c 91XX9824.UPI Ref:360535908349;Balance:https://m.paytm.me/pbCheckBal; Help:http://m.p-y.tm/care ";

  PaytmBank() {
    account = 1000 + random.nextInt(10000 - 1000);
    balance = random.nextDouble() * 30000;
  }

  Map<String, dynamic> generateSms(
      {required String txnType, required int millisecond}) {
    String smsBody = '';

    if (txnType.toLowerCase() == 'debit') {
      int amount = 50 + random.nextInt(1000 - 50);

      int randomUTR1 = 10000 + random.nextInt(100000 - 10000);
      int randomUTR2 = 100000 + random.nextInt(1000000 - 100000);
      List upis = [
        "manojsingh13031979@oksbi",
        "jayraj8899@okicici",
        "7523669677@ybl",
        "8527414336@upi",
        "appolaau@ybl"
      ];
      if (amount < balance) {
        balance = balance - amount;
        smsBody = "Rs." +
            amount.toStringAsFixed(2) +
            " sent to " +
            upis[random.nextInt(upis.length)] +
            " from PPBL a/c 91XX" +
            account.toString() +
            ".UPI Ref:3" +
            randomUTR1.toString() +
            "" +
            randomUTR2.toString() +
            ";Balance:https://m.paytm.me/pbCheckBal; Help:http://m.p-y.tm/care ";
      } else {
        txnType = 'credit';
      }
    }

    if (txnType.toLowerCase() == "credit") {
      int amount = 10 + random.nextInt(100 - 10);
      balance = balance + amount;

      smsBody = "Rs." +
          amount.toStringAsFixed(2) +
          " received to PPBL a/c 91XX" +
          account.toString() +
          ". Balance:https://m.paytm.me/pbCheckBal; Help:http://m.p-y.tm/care ";
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
