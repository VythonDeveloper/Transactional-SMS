import 'dart:math';
import 'package:intl/intl.dart';

class ICICIBank {
  Random random = new Random();
  // ICICI Bank Variables
  int account = 100; //3 digit
  double balance = 50000;
  List address = ['VD-ICICI'];
  List serviceNumbers = [
    '+911725199998',
    '+917012075009',
    '+919442499994',
    '+917011075093'
  ];
  String debitSms =
      "We have credited your ICICI Bank Account XX022 with INR 5,067.00 on 25-Jul-23. Info:INF*INFT*033034767191*263956. The Available Balance is INR 5,441.71.";
  String creditSms =
      "ICICI Bank Account XX022 is credited with Rs 1,925.00 on 29-Jul-23 by Account linked to mobile number XXXXX56689. IMPS Ref. no. 321011467780.";

  ICICIBank() {
    account = 100 + random.nextInt(1000 - 100);
    balance = random.nextDouble() * 50000;
  }

  Map<String, dynamic> generateSms(
      {required String txnType, required int millisecond}) {
    String smsBody = '';
    DateTime txnDate = DateTime.fromMillisecondsSinceEpoch(millisecond);
    String formatTxnDate = DateFormat('dd-MMM-yyyy').format(txnDate);

    if (random.nextInt(2) == 1) {
      int amount = 900 + random.nextInt(10000 - 900);
      balance = balance + amount;
      int randomUTR1 = 100000 + random.nextInt(1000000 - 100000);
      int randomUTR2 = 100000 + random.nextInt(1000000 - 100000);
      int randomUTR3 = 100000 + random.nextInt(1000000 - 100000);

      smsBody = "We have credited your ICICI Bank Account XX" +
          account.toString() +
          " with INR " +
          amount.toString() +
          ".00 on " +
          formatTxnDate +
          ". Info:INF*INFT*" +
          randomUTR1.toString() +
          "" +
          randomUTR2.toString() +
          "*" +
          randomUTR3.toString() +
          ". The Available Balance is INR " +
          balance.toStringAsFixed(2) +
          ".";
    } else {
      int amount = 900 + random.nextInt(10000 - 900);
      balance = balance + amount;

      int randomPhone = 10000 + random.nextInt(100000 - 10000);
      int randomUTR1 = 1000 + random.nextInt(10000 - 1000);
      int randomUTR2 = 100000 + random.nextInt(1000000 - 100000);
      smsBody = "ICICI Bank Account XX" +
          account.toString() +
          " is credited with Rs " +
          amount.toString() +
          ".00 on " +
          formatTxnDate +
          " by Account linked to mobile number XXXXX" +
          randomPhone.toString() +
          ". IMPS Ref. no. 3" +
          randomUTR1.toString() +
          "1" +
          randomUTR2.toString() +
          ".";
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
