import 'dart:math';
import 'package:intl/intl.dart';

class ZomatoPromt {
  Random random = new Random();
  // Kotak Bank Variables
  List address = ['TM-ZOMATO'];
  List serviceNumbers = [
    '+911725199998',
  ];
  String sms1 =
      "564365 is the OTP to login to your Zomato account. DO NOT disclose it to anyone. AlOe4TVDpqm";

  ZomatoPromt() {}

  Map<String, dynamic> generateSms(
      {required String txnType, required int millisecond}) {
    String smsBody = '';

    int randomOtp = 100000 + random.nextInt(1000000 - 100000);

    smsBody = randomOtp.toString() +
        " is the OTP to login to your Zomato account. DO NOT disclose it to anyone. AlOe4TVDpqm";

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
