import 'dart:math';
import 'package:intl/intl.dart';

class SBIBank {
  Random random = new Random();
  // SBI Bank Variables
  int account = 1000; //4 digit
  double balance = 500;
  List address = [
    'BX-SBIPSG',
    'BX-SBIINB',
    'BW-SBIPSG',
    'CP-SBIPSG',
    'VK-SBIINB',
    'AD-SBIPSG',
    'AX-SBIINB',
    'VM-SBIINB'
  ];

  List upiAddress = [
    'BW-SBIUPI',
    'BX-SBIUPI',
    'CP-SBIUPI',
    'VK-SBIUPI',
    'AD-SBIUPI',
    'AX-SBIUPI',
    'VM-SBIUPI'
  ];
  List serviceNumbers = [
    '+911725199998',
    '+917012075009',
    '+919442499994',
    '+917011075093'
  ];
  String debitSms =
      "Dear Customer, INR 54,315.00 credited to your A/c No XX5326 on 07/07/2023 through NEFT with UTR AXNFCN0270963545 by RESILIENT INNOVATIONS PRIVATE LIMIT, INFO: /CUST/ RESILIENT INNOVATIONS PRIVAT //E LIMITED- NODAL ACCOUNT-SBI";
  String creditSms =
      "Dear Customer, Your a/c no. XXXXXXXX5838 is credited by Rs.2395.00 on 29-07-23 by a/c linked to mobile 9XXXXXX999-GREEN WORLD (IMPS Ref no 321010642074).If not done by you, call 1800111109. -SBI";
  String upiSms =
      "Dear UPI user A/C X1975 debited by 201.0 on date 25Aug23 trf to Bharti Airtel Li Refno 360383045199. If not u? call 1800111109. -SBI";
  SBIBank() {
    account = 1000 + random.nextInt(10000 - 1000);
    balance = random.nextDouble() * 8000;
  }

  Map<String, dynamic> generateSms(
      {required String txnType, required int millisecond}) {
    String smsBody = '';
    DateTime txnDate = DateTime.fromMillisecondsSinceEpoch(millisecond);

    String smsAddress = '';
    int whichSms = random.nextInt(2);

    if (whichSms == 1) {
      smsAddress = address[random.nextInt(address.length)];
      int amount = 900 + random.nextInt(4300 - 900);
      balance = balance + amount;
      String formatTxnDate = txnDate.day.toString().padLeft(2, '0') +
          "/" +
          txnDate.month.toString().padLeft(2, '0') +
          "/" +
          txnDate.year.toString();
      int randomUTR = 100000 + random.nextInt(1000000 - 100000);

      smsBody = "Dear Customer, INR " +
          amount.toStringAsFixed(2) +
          " credited to your A/c No XX" +
          account.toString() +
          " on " +
          formatTxnDate +
          " through NEFT with UTR AXNFCN0270" +
          randomUTR.toString() +
          " by RESILIENT INNOVATIONS PRIVATE LIMIT, INFO: /CUST/ RESILIENT INNOVATIONS PRIVAT //E LIMITED- NODAL ACCOUNT-SBI";
    } else {
      smsAddress = upiAddress[random.nextInt(upiAddress.length)];
      int amount = 50 + random.nextInt(4300 - 50);
      if (amount < balance) {
        balance = balance - amount;

        String formatTxnDate = DateFormat('ddMMMyy').format(txnDate);
        int randomUTR1 = 10000 + random.nextInt(100000 - 10000);
        int randomUTR2 = 100000 + random.nextInt(1000000 - 100000);
        List recipient = [
          "Bharti Airtel Li",
          "Vodafone Idea",
          "Jio",
          "Ramesh",
          "Akhil",
          "Bhavna"
        ];
        smsBody = "Dear UPI user A/C X" +
            account.toString() +
            " debited by " +
            amount.toStringAsFixed(1) +
            " on date " +
            formatTxnDate +
            " trf to " +
            recipient[random.nextInt(recipient.length)] +
            " Refno 3" +
            randomUTR1.toString() +
            "" +
            randomUTR2.toString() +
            ". If not u? call 1800111109. -SBI";
      } else {
        int amount = 900 + random.nextInt(4300 - 900);
        balance = balance + amount;
        String formatTxnDate = txnDate.day.toString().padLeft(2, '0') +
            "-" +
            txnDate.month.toString().padLeft(2, '0') +
            "-" +
            txnDate.year.toString();
        int randomPhone = 100 + random.nextInt(1000 - 100);
        int randomUTR = 100000 + random.nextInt(1000000 - 100000);
        smsBody = "Dear Customer, Your a/c no. XXXXXXXX" +
            account.toString() +
            " is credited by Rs." +
            amount.toStringAsFixed(2) +
            " on " +
            formatTxnDate +
            " by a/c linked to mobile " +
            (6 + random.nextInt(9 - 6)).toString() +
            "XXXXXX" +
            randomPhone.toString() +
            "-GREEN WORLD (IMPS Ref no 321010" +
            randomUTR.toString() +
            ").If not done by you, call 1800111109. -SBI";
      }
    }

    return {
      "_protocol": "0",
      "_address": smsAddress,
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
