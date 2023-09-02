import 'dart:math';
import 'package:intl/intl.dart';

class HDFCBank {
  Random random = new Random();
  // HDFC Bank Variables
  int account = 1000; //4 digit
  double balance = 500;
  List address = ['VM-HDFCBK', 'TM-HDFCBK', 'JK-HDFCBK'];
  List serviceNumbers = ['+911725199998', '+919442499994', '+917011075093'];
  String debitSms =
      "HDFC Bank: Rs 5000.00 debited from a/c **6747 on 08-04-23 to VPA BHARATPE.90060772009@fbpe(UPI Ref No 309837454529). Not you? Call on 18002586161 to report";

  HDFCBank() {
    account = 1000 + random.nextInt(10000 - 1000);
    balance = random.nextDouble() * 8000;
  }

  Map<String, dynamic> generateSms(
      {required String txnType, required int millisecond}) {
    String smsBody = '';
    DateTime txnDate = DateTime.fromMillisecondsSinceEpoch(millisecond);
    String formatTxnDate = txnDate.day.toString().padLeft(2, '0') +
        "-" +
        txnDate.month.toString().padLeft(2, '0') +
        "-" +
        txnDate.year.toString();

    if (txnType.toLowerCase() == 'debit') {
      int amount = 100 + random.nextInt(5100 - 100);
      if (amount < balance) {
        balance = balance - amount;
        List upis = [
          "manojsingh13031979@oksbi",
          "jayraj8899@okicici",
          "7523669677@ybl",
          "8527414336@upi",
          "90060772009@fbpe"
        ];
        int randomUTR1 = 10000 + random.nextInt(100000 - 10000);
        int randomUTR2 = 100000 + random.nextInt(1000000 - 100000);

        smsBody = "HDFC Bank: Rs " +
            amount.toStringAsFixed(2) +
            " debited from a/c **" +
            account.toString() +
            " on " +
            formatTxnDate +
            " to VPA " +
            upis[random.nextInt(upis.length)] +
            "(UPI Ref No 3" +
            randomUTR1.toString() +
            "" +
            randomUTR2.toString() +
            "). Not you? Call on 18002586161 to report";
      } else {
        txnType = 'credit';
      }
    }

    if (txnType.toLowerCase() == "credit") {
      int amount = 50 + random.nextInt(4300 - 50);
      balance = balance + amount;
      smsBody = "HDFC Bank: Rs " +
          amount.toStringAsFixed(2) +
          " credited to a/c **" +
          account.toString() +
          " on " +
          formatTxnDate +
          ". Avl. Bal. Rs " +
          balance.toStringAsFixed(2);
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
