import 'dart:math';
import 'package:intl/intl.dart';

class MeeshoPromt {
  Random random = new Random();
  // Meesho Bank Variables
  int account = 1000; //4 digit
  double balance = 1000000;
  List address = ['JM-MSHAPP'];
  List serviceNumbers = [
    '+911725199998',
  ];
  String sms1 =
      "Your product has been successfully delivered! We'd love to hear your feedback. Click here sprw.io/sntt-56192d?o_id=940281019&u_id=31869914 Meesho";

  String sms2 =
      "Thank you for being a part of Meesho! Kindy share your experience with us by clicking below & help us to serve you better https://bit.ly/3kuDqiU Meesho";

  MeeshoPromt() {}

  Map<String, dynamic> generateSms(
      {required String txnType, required int millisecond}) {
    String smsBody = '';

    int randomUid = 100000 + random.nextInt(1000000 - 100000);

    if (random.nextInt(2) == 1) {
      smsBody =
          "Your product has been successfully delivered! We'd love to hear your feedback. Click here sprw.io/sntt-56192d?o_id=940281019&u_id=3" +
              randomUid.toString() +
              "4 Meesho";
    } else {
      smsBody =
          "Thank you for being a part of Meesho! Kindy share your experience with us by clicking below & help us to serve you better https://bit.ly/3kuDqiU Meesho";
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
