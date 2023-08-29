import 'dart:math';
import 'package:intl/intl.dart';

class FederalBank {
  Random random = new Random();
  // Federal Bank Variables
  int account = 1000; //4 digit
  double balance = 30000;
  String name = '';
  List address = [
    'VM-FedFiB',
    'JM-ONJPTR',
    'JD-FedFiB',
    'AD-FedFiB',
    'VM-FedFiB',
    'BP-FedFiB',
    'AX-FedFiB',
    'JM-FedFiB'
  ];
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
  String sms3 =
      "Rs 1.00 debited from your A/c using UPI on 27-08-2023 19:19:01 to VPA appolaau@ybl - (UPI Ref No 323919976089)-Federal Bank";
  FederalBank() {
    account = 1000 + random.nextInt(10000 - 1000);
    balance = random.nextDouble() * 30000;
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
    int amount = 1000 + random.nextInt(10000 - 1000);
    balance = balance + amount;

    int whichSms = random.nextInt(3);

    if (txnType.toLowerCase() == 'debit') {
      int amount = 50 + random.nextInt(800 - 50);
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
        "8527414336@upi",
        "appolaau@ybl"
      ];
      if (amount < balance) {
        balance = balance - amount;
        smsBody = "Rs " +
            amount.toStringAsFixed(2) +
            " debited from your A/c using UPI on " +
            formatTxnDate +
            " to VPA " +
            upis[random.nextInt(upis.length)] +
            " - (UPI Ref No 3" +
            randomUTR1.toString() +
            "" +
            randomUTR2.toString() +
            ")-Federal Bank";
      } else {
        txnType = 'credit';
      }
    }

    if (txnType.toLowerCase() == "credit") {
      if (whichSms == 1) {
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
