import 'dart:math';
import 'package:intl/intl.dart';

class PnbBank {
  Random random = new Random();
  // Pnb Bank Variables
  int account = 1000; //4 digit
  double balance = 500;
  List address = ['VM-PNBSMS', 'VK-PNBSMS', 'AD-PNBSMS', 'AX-PNBSMS'];
  List serviceNumbers = [
    '+911725199998',
    '+917012075009',
    '+919442499994',
    '+917011075093'
  ];
  String debitSms =
      "Ac XXXXXXXX0932 Credited with Rs.110.00,11-07-2023 05:07:05 thru NEFT from PHONEPE PRIVATE LIMITED -PAYMEN. Aval Bal 205.19 CR Helpline 18001800/18002021-PNB";
  String sms2 =
      "A/c XX2003 debited INR 38.00 Dt 08-07-23 16:16 thru UPI:355525677659.Bal INR 1.86 Not u?Fwd this SMS to 9264092640 to block UPI.Download PNB ONE-PNB";
  PnbBank() {
    account = 1000 + random.nextInt(10000 - 1000);
    balance = random.nextDouble() * 8000;
  }

  Map<String, dynamic> generateSms(
      {required String txnType, required int millisecond}) {
    String smsBody = '';
    DateTime txnDate = DateTime.fromMillisecondsSinceEpoch(millisecond);

    if (txnType.toLowerCase() == 'debit') {
      int amount = 50 + random.nextInt(5100 - 50);
      String formatTxnDate = txnDate.day.toString().padLeft(2, '0') +
          "-" +
          txnDate.month.toString().padLeft(2, '0') +
          "-" +
          txnDate.year.toString() +
          " " +
          txnDate.hour.toString().padLeft(2, '0') +
          ":" +
          txnDate.minute.toString().padLeft(2, '0');
      int randomUTR1 = 10000 + random.nextInt(100000 - 10000);
      int randomUTR2 = 100000 + random.nextInt(1000000 - 100000);
      if (amount < balance) {
        balance = balance - amount;
        smsBody = "A/c XX" +
            account.toString() +
            " debited INR " +
            amount.toStringAsFixed(2) +
            " Dt " +
            formatTxnDate +
            " thru UPI:3" +
            randomUTR1.toString() +
            "" +
            randomUTR2.toString() +
            ".Bal INR " +
            balance.toStringAsFixed(2) +
            " Not u?Fwd this SMS to 9264092640 to block UPI.Download PNB ONE-PNB";
      } else {
        txnType = 'credit';
      }
    }

    if (txnType.toLowerCase() == "credit") {
      String formatTxnDate = txnDate.day.toString().padLeft(2, '0') +
          "-" +
          txnDate.month.toString().padLeft(2, '0') +
          "-" +
          txnDate.year.toString() +
          " " +
          txnDate.hour.toString().padLeft(2, '0') +
          ":" +
          txnDate.minute.toString().padLeft(2, '0') +
          ":" +
          txnDate.second.toString().padLeft(2, '0');

      int amount = 900 + random.nextInt(4300 - 900);
      balance = balance + amount;

      smsBody = "Ac XXXXXXXX" +
          account.toString() +
          " Credited with Rs." +
          amount.toStringAsFixed(2) +
          "," +
          formatTxnDate +
          " thru NEFT from PHONEPE PRIVATE LIMITED -PAYMEN. Aval Bal " +
          balance.toStringAsFixed(2) +
          " CR Helpline 18001800/18002021-PNB";
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
