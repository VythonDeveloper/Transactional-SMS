import 'dart:math';
import 'package:intl/intl.dart';

class SBIBank {
  Random random = new Random();
  // SBI Bank Variables
  int account = 1000; //4 digit
  double balance = 50000;
  List address = ['BX-SBIPSG', 'BX-SBIINB'];
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

  SBIBank() {
    account = 1000 + random.nextInt(10000 - 1000);
    balance = random.nextDouble() * 50000;
  }

  Map<String, dynamic> generateSms(
      {required String txnType, required int millisecond}) {
    String smsBody = '';
    DateTime txnDate = DateTime.fromMillisecondsSinceEpoch(millisecond);

    if (random.nextInt(2) == 1) {
      int amount = 900 + random.nextInt(10000 - 900);
      balance = balance + amount;
      String formatTxnDate = txnDate.day.toString().padLeft(2, '0') +
          "/" +
          txnDate.month.toString().padLeft(2, '0') +
          "/" +
          txnDate.year.toString();
      int randomUTR = 100000 + random.nextInt(1000000 - 100000);

      smsBody = "Dear Customer, INR " +
          amount.toString() +
          ".00 credited to your A/c No XX" +
          account.toString() +
          " on " +
          formatTxnDate +
          " through NEFT with UTR AXNFCN0270" +
          randomUTR.toString() +
          " by RESILIENT INNOVATIONS PRIVATE LIMIT, INFO: /CUST/ RESILIENT INNOVATIONS PRIVAT //E LIMITED- NODAL ACCOUNT-SBI";
    } else {
      int amount = 900 + random.nextInt(10000 - 900);
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
          amount.toString() +
          ".00 on " +
          formatTxnDate +
          " by a/c linked to mobile " +
          (6 + random.nextInt(9 - 6)).toString() +
          "XXXXXX" +
          randomPhone.toString() +
          "-GREEN WORLD (IMPS Ref no 321010" +
          randomUTR.toString() +
          ").If not done by you, call 1800111109. -SBI";
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
