import 'dart:math';
import 'package:intl/intl.dart';

class FederalBank {
  Random random = new Random();
  // Federal Bank Variables
  int account = 1000; //4 digit
  double balance = 1000000;
  String name = '';
  List address = ['VM-FedFiB', 'JM-ONJPTR'];
  List serviceNumbers = [
    '+911725199998',
    '+917012075009',
    '+919442499994',
    '+917011075093'
  ];
  String fedibCreditSms1 =
      "Bharath, you've received INR 13,980.00 in your Account XXXXXXXX5497. Woohoo! It was sent by 2899 on July 17, 2023. -Federal Bank";
  String fedibCreditSms2 =
      "Update! INR1487.0 was credited to your Federal Bank account xxxx9286  on the Jupiter app. Happy Banking!";

  FederalBank() {
    account = 1000 + random.nextInt(10000 - 1000);
    balance = random.nextDouble() * 1000000;
    List randomNames = [
      'Abhinav',
      'Bhaskar',
      'Chetan',
      'Devendra',
      'Kavita',
      'Leela',
      'Meera',
      'Neha',
      'Ojaswini',
      'Pooja',
      'Radha',
      'Sanya',
      'Tanvi',
      'Uma',
      'Vaishnavi',
      'Yamini',
      'Eshan',
      'Farhan',
      'Karan',
      'Lakshya',
      'Manish',
      'Naveen',
      'Devika',
      'Esha',
      'Farida',
      'Gauri',
      'Heena',
      'Ishita',
      'Omkar',
      'Pranav',
      'Rahul',
      'Siddharth',
      'Tushar',
      'Varun',
      'Yash',
      'Zaid',
      'Girish',
      'Harsh',
      'Ishan',
      'Jatin',
      'Aishwarya',
      'Bhavna',
      'Chitra',
      'Jaya'
    ];
    name = randomNames[random.nextInt(randomNames.length)];
  }

  Map<String, dynamic> generateSms(
      {required String txnType, required int millisecond}) {
    String smsBody = '';
    DateTime txnDate = DateTime.fromMillisecondsSinceEpoch(millisecond);
    String formatTxnDate = DateFormat('MMMM dd, yyyy').format(txnDate);

    int randomNumber = 1000 + random.nextInt(10000 - 1000);

    int amount = 1000 + random.nextInt(100000 - 1000);
    balance = balance + amount;
    if (random.nextInt(2) == 1) {
      smsBody = name +
          ", you've received INR " +
          amount.toStringAsFixed(2) +
          " in your Account XXXXXXXX" +
          account.toString() +
          ". Woohoo! It was sent by " +
          randomNumber.toString() +
          " on " +
          formatTxnDate +
          ". -Federal Bank";
    } else {
      smsBody = "Update! INR" +
          amount.toStringAsFixed(1) +
          " was credited to your Federal Bank account xxxx" +
          account.toString() +
          "  on the Jupiter app. Happy Banking!";
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
