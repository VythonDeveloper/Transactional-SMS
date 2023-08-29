import 'dart:math';
import 'package:intl/intl.dart';

class SwiggyPromt {
  Random random = new Random();
  // Swiggy Bank Variables
  List address = ['TX-SWIGGY'];
  List serviceNumbers = [
    '+911725199998',
  ];
  String sms1 =
      "Use OTP 753822 to log into your Swiggy account. Do not share the OTP or your number with anyone including Swiggy personnel. ASkSzFWMk3x";

  String sms2 =
      "Your order #132493847896 was delivered superfast in 18 minutes! Keep ordering from Swiggy to experience our lightning fast delivery.";

  SwiggyPromt() {}

  Map<String, dynamic> generateSms(
      {required String txnType, required int millisecond}) {
    String smsBody = '';

    int randomOTP = 100000 + random.nextInt(1000000 - 100000);

    int whichSms = random.nextInt(2);

    if (whichSms == 1) {
      smsBody = "Use OTP " +
          randomOTP.toString() +
          " to log into your Swiggy account. Do not share the OTP or your number with anyone including Swiggy personnel. ASkSzFWMk3x";
    } else {
      int randomMinute = 11 + random.nextInt(19 - 11);
      smsBody = "Your order #132493" +
          randomOTP.toString() +
          " was delivered superfast in " +
          randomMinute.toString() +
          " minutes! Keep ordering from Swiggy to experience our lightning fast delivery.";
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
