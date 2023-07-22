import 'dart:math';
import 'package:intl/intl.dart';

class FlipkartPromt {
  Random random = new Random();
  // Flipkart Bank Variables
  int account = 1000; //4 digit
  double balance = 1000000;
  List address = ['JD-FLPKRT'];
  List serviceNumbers = [
    '+911725199998',
  ];
  String sms1 =
      """Dear Customer, Did You Know? You can now get a Personal Loan up to Rs.5 Lakh* on Flipkart. Apply & get approval in just 30secs > 
      http://fkrt.it/VmhPSGuuuN """;

  String sms2 =
      "Your prepaid shipment is out for delivery - Share code 2054 to receive the shipment. Call 9598443208 to connect directly with agent - Ecom Express";

  FlipkartPromt() {}

  Map<String, dynamic> generateSms(
      {required String txnType, required int millisecond}) {
    String smsBody = '';

    if (random.nextInt(2) == 1) {
      smsBody =
          """Dear Customer, Did You Know? You can now get a Personal Loan up to Rs.5 Lakh* on Flipkart. Apply & get approval in just 30secs > 
      
http://fkrt.it/VmhPSGuuuN """;
    } else {
      int randomOtp = 1000 + random.nextInt(10000 - 1000);
      smsBody = "Your prepaid shipment is out for delivery - Share code " +
          randomOtp.toString() +
          " to receive the shipment. Call 9598443208 to connect directly with agent - Ecom Express";
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
