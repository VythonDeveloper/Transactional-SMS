import 'dart:math';
import 'package:intl/intl.dart';

class CanaraBank {
  Random random = new Random();
  // Canara Bank Variables
  int account = 100; //3 digit
  double balance = 30000;
  List address = [
    'QP-CANBNK',
    'JD-CANBNK',
    'VM-CANBNK',
    'VK-CANBNK',
    'CP-CANBNK',
    'JD-CANBNK'
  ];
  List serviceNumbers = [
    '+911725199998',
    '+917012075009',
    '+919442499994',
    '+917011075093'
  ];
  String debitSms =
      "An amount of INR 6494.00 has been DEBITED to your account XXX400 on 13-07-2023. Total Avail.bal INR 3513.22 - Canara Bank";
  String creditSms =
      "An amount of INR 4602.00 has been CREDITED to your account XXX669 on 15-07-2023.Total Avail.bal INR 47250.00- Canara Bank";
  String sms3 =
      "Your A/c No:XX1648 has been credited with Rs.13000.00 on 11-08-2023 07:40:47 from UPI-ID manojsingh13031979@oksbi (UPI Ref no 321162585086).-Canara Bank";

  CanaraBank() {
    account = 100 + random.nextInt(1000 - 100);
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
      int amount = 50 + random.nextInt(5100 - 50);
      if (amount < balance) {
        balance = balance - amount;
        smsBody = "An amount of INR " +
            amount.toStringAsFixed(2) +
            " has been DEBITED to your account XXX" +
            account.toString() +
            " on " +
            formatTxnDate +
            ". Total Avail.bal INR " +
            balance.toStringAsFixed(2) +
            " - Canara Bank";
      } else {
        txnType = 'credit';
      }
    }

    if (txnType.toLowerCase() == "credit") {
      if (random.nextInt(2) == 1) {
        int amount = 50 + random.nextInt(4300 - 50);
        balance = balance + amount;
        smsBody = "An amount of INR " +
            amount.toStringAsFixed(2) +
            " has been CREDITED to your account XXX" +
            account.toString() +
            " on " +
            formatTxnDate +
            ".Total Avail.bal INR " +
            balance.toStringAsFixed(2) +
            "- Canara Bank";
      } else {
        int amount = 300 + random.nextInt(10000 - 300);
        balance = balance + amount;
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
        int randomUTR1 = 10000 + random.nextInt(100000 - 10000);
        int randomUTR2 = 100000 + random.nextInt(1000000 - 100000);
        List upis = [
          "manojsingh13031979@oksbi",
          "jayraj8899@okicici",
          "7523669677@ybl",
          "8527414336@upi"
        ];

        smsBody = "Your A/c No:XX" +
            account.toString() +
            " has been credited with Rs." +
            amount.toStringAsFixed(2) +
            " on " +
            formatTxnDate +
            " from UPI-ID " +
            upis[random.nextInt(upis.length)] +
            " (UPI Ref no 3" +
            randomUTR1.toString() +
            "" +
            randomUTR2.toString() +
            ").-Canara Bank";
      }
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
