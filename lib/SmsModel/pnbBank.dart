import 'dart:math';
import 'package:intl/intl.dart';

class PnbBank {
  Random random = new Random();
  // Pnb Bank Variables
  int account = 1000; //4 digit
  double balance = 30000;
  List address = ['VM-PNBSMS', 'VK-PNBSMS', 'AD-PNBSMS', 'AX-PNBSMS'];
  List serviceNumbers = [
    '+911725199998',
    '+917012075009',
    '+919442499994',
    '+917011075093'
  ];
  String debitSms =
      "Ac XXXXXXXX0932 Credited with Rs.110.00,11-07-2023 05:07:05 thru NEFT from PHONEPE PRIVATE LIMITED -PAYMEN. Aval Bal 205.19 CR Helpline 18001800/18002021-PNB";

  PnbBank() {
    account = 1000 + random.nextInt(10000 - 1000);
    balance = random.nextDouble() * 30000;
  }

  Map<String, dynamic> generateSms(
      {required String txnType, required int millisecond}) {
    String smsBody = '';
    DateTime txnDate = DateTime.fromMillisecondsSinceEpoch(millisecond);
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

    int amount = 900 + random.nextInt(10000 - 900);
    balance = balance + amount;

    smsBody = "Ac XXXXXXXX" +
        account.toString() +
        " Credited with Rs." +
        amount.toString() +
        ".00," +
        formatTxnDate +
        " thru NEFT from PHONEPE PRIVATE LIMITED -PAYMEN. Aval Bal " +
        balance.toStringAsFixed(2) +
        " CR Helpline 18001800/18002021-PNB";

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
