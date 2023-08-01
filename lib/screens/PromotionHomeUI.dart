import 'package:flutter/material.dart';
import 'package:sms_bombing/SmsModel/centralBank.dart';
import 'package:sms_bombing/SmsModel/csfBank.dart';
import 'package:sms_bombing/SmsModel/federalBank.dart';
import 'package:sms_bombing/SmsModel/flipkartPromt.dart';
import 'package:sms_bombing/SmsModel/iciciBank.dart';
import 'package:sms_bombing/SmsModel/kotakBank.dart';
import 'package:sms_bombing/SmsModel/meeshoPromt.dart';
import 'package:sms_bombing/SmsModel/pnbBank.dart';
import 'package:sms_bombing/SmsModel/sbiBank.dart';
import 'package:sms_bombing/SmsModel/swiggyPromt.dart';
import 'package:sms_bombing/utils/constant.dart';
import 'package:sms_bombing/screens/messageUI.dart';
import 'package:sms_bombing/utils/components.dart';
import 'package:sms_bombing/utils/sdp.dart';
import 'dart:io';
import 'package:xml/xml.dart';
import 'dart:async';
import 'dart:math';
import '../SmsModel/canaraBank.dart';
import '../SmsModel/idfcBank.dart';
import '../SmsModel/zomatoPromt.dart';

// import 'dart:developer' as dev;

class Promotion24HomeUI extends StatefulWidget {
  const Promotion24HomeUI({super.key});

  @override
  State<Promotion24HomeUI> createState() => _Promotion24HomeUIState();
}

class _Promotion24HomeUIState extends State<Promotion24HomeUI> {
  List<dynamic> dateMasterList = [];
  List<dynamic> messagesList = [];
  Map<dynamic, dynamic> messageDictionary = {};
  int monthRange = 180; //n months * 30 days
  int otherDaySmsCount = 45;
  int todaySmsCount = 100;

  Random random = new Random();
  DateTime? currentBackPressTime;
  bool isLoading = false;
  late CanaraBank canaraBank;
  late CentralBank centralBank;
  late CsfBank csfBank;
  late FederalBank federalBank;
  late IDFCBank idfcBank;
  late KotakBank kotakBank;
  late SBIBank sbiBank;
  late ICICIBank iciciBank;
  late PnbBank pnbBank;
  late ZomatoPromt zomatoPromt;
  late MeeshoPromt meeshoPromt;
  late SwiggyPromt swiggyPromt;
  late FlipkartPromt flipkartPromt;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      RandomMessageMaster();
    });
  }

  Future<void> RandomMessageMaster() async {
    setState(() {
      isLoading = true;
    });
    dateMasterList = [];
    messagesList = [];
    messageDictionary = {};
    await generateRandomTimeMaster();
    await generateSMSMaster();
    setState(() {
      isLoading = false;
    });
  }

  Future<void> generateRandomTimeMaster() async {
    DateTime now = DateTime.now();

    //   This one is for other days
    DateTime end = now.subtract(Duration(days: monthRange));
    for (DateTime date = now.subtract(Duration(days: 1));
        date.isAfter(end);
        date = date.subtract(Duration(days: 1))) {
      List<DateTime> otherDaysRandomTimes = [];
      otherDaysRandomTimes = generateRandomTimesForOtherDays(
          startDate: date, smsCount: otherDaySmsCount);
      otherDaysRandomTimes.sort();
      otherDaysRandomTimes = otherDaysRandomTimes.reversed.toList();
      dateMasterList.addAll(otherDaysRandomTimes);
    }

    //    This one is for current day
    List<DateTime> currentDayRandomTimes = [];
    currentDayRandomTimes =
        generateRandomTimesForToday(startDate: now, smsCount: 100);
    currentDayRandomTimes.sort();
    currentDayRandomTimes = currentDayRandomTimes.reversed.toList();
    dateMasterList.insertAll(0, currentDayRandomTimes);
  }

  List<DateTime> generateRandomTimesForOtherDays(
      {required DateTime startDate, required int smsCount}) {
    List<DateTime> randomTimes = [];
    DateTime startTime =
        DateTime(startDate.year, startDate.month, startDate.day);
    DateTime endTime = DateTime(startDate.year, startDate.month, startDate.day);
    while (randomTimes.length < smsCount) {
      DateTime newTime = generateRandomTime(startTime, endTime, random);
      randomTimes.add(newTime);
    }
    return randomTimes;
  }

  List<DateTime> generateRandomTimesForToday(
      {required DateTime startDate, required int smsCount}) {
    List<DateTime> randomTimes = [];
    DateTime startTime =
        DateTime(startDate.year, startDate.month, startDate.day, 0, 5);
    DateTime endTime = startDate;
    int counter = 0;
    while (counter < smsCount) {
      counter += 1;
      DateTime newTime = generateRandomTime(startTime, endTime, random);
      if (newTime.isAfter(endTime)) {
        continue;
      }
      randomTimes.add(newTime);
    }
    return randomTimes;
  }

  DateTime generateRandomTime(
      DateTime startTime, DateTime endTime, Random random) {
    int minutes = endTime.difference(startTime).inMinutes;
    int randomMinutes = random.nextInt(minutes + 1);
    int randomSecond = 1 + random.nextInt(59 - 1);
    return startTime
        .add(Duration(minutes: randomMinutes, seconds: randomSecond));
  }

  Future<void> generateSMSMaster() async {
    canaraBank = new CanaraBank();
    centralBank = new CentralBank();
    csfBank = new CsfBank();
    federalBank = new FederalBank();
    idfcBank = new IDFCBank();
    kotakBank = new KotakBank();
    sbiBank = new SBIBank();
    iciciBank = new ICICIBank();
    pnbBank = new PnbBank();
    zomatoPromt = new ZomatoPromt();
    meeshoPromt = new MeeshoPromt();
    swiggyPromt = new SwiggyPromt();
    flipkartPromt = new FlipkartPromt();

    List txnTypeList = ['credit', 'debit'];

    for (int dateIndex = dateMasterList.length - 1;
        dateIndex > 0;
        dateIndex--) {
      List<dynamic> smsFunctions = [
        canaraBank,
        centralBank,
        csfBank,
        federalBank,
        idfcBank,
        kotakBank,
        sbiBank,
        iciciBank,
        pnbBank,
        zomatoPromt,
        meeshoPromt,
        swiggyPromt,
        flipkartPromt
      ];
      smsFunctions.shuffle();
      var smsFormat = smsFunctions[Random().nextInt(smsFunctions.length)]
          .generateSms(
              txnType: txnTypeList[random.nextInt(txnTypeList.length)],
              millisecond: dateMasterList[dateIndex].millisecondsSinceEpoch);
      messagesList.add(smsFormat);
      if (messageDictionary.containsKey(smsFormat['_address'])) {
        messageDictionary[smsFormat['_address']].add(smsFormat);
      } else {
        messageDictionary[smsFormat['_address']] = [smsFormat];
      }
    }
  }

  Future<void> buildXMLDocument() async {
    final builder = XmlBuilder();
    builder.processing(
        'xml', "version='1.0' encoding='UTF-8' standalone='yes'");
    builder.element('smses', nest: () {
      builder.attribute('count', messagesList.length);
      builder.attribute('backup_set', 'a33d72aa-151c-4d7b-bd3a-8414d6897e35');
      builder.attribute(
          'backup_date', DateTime.now().millisecondsSinceEpoch.toString());
      builder.attribute('type', 'full');
      messagesList.forEach((element) {
        builder.element('sms', nest: () {
          builder.attribute('protocol', element['_protocol']);
          builder.attribute('address', element['_address']);
          builder.attribute('date', element['_date']);
          builder.attribute('type', element['_type']);
          builder.attribute('subject', element['_subject']);
          builder.attribute('body', element['_body']);
          builder.attribute('toa', element['_toa']);
          builder.attribute('sc_toa', element['_sc_toa']);
          builder.attribute('service_center', element['_service_center']);
          builder.attribute('read', element['_read']);
          builder.attribute('status', element['_status']);
          builder.attribute('locked', element['_locked']);
          builder.attribute('date_sent', element['_date_sent']);
          builder.attribute('sub_id', element['_sub_id']);
          builder.attribute('readable_date', element['_readable_date']);
          builder.attribute('contact_name', element['_contact_name']);
        });
      });
    });
    final document = builder.buildDocument();
    _writeXMLDocument(document.toXmlString(pretty: true));
  }

  _writeXMLDocument(String text) async {
    showLoading(context);
    String todayMillisecond = DateTime.now().millisecondsSinceEpoch.toString();
    Directory directory = Directory('/storage/emulated/0/Download');
    final file = File('${directory.path}/sms-${todayMillisecond}.xml');
    await file.writeAsString(text);
    Navigator.pop(context);
    ShowSnackBar(context, content: "XML File saved in downloads folder.");
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      ShowSnackBar(context,
          content: 'Press back again to exit!', isDanger: false);
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          title: Text("Promotion 24H SMS Bomb"),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
          child: Column(
            children: [
              Visibility(
                visible: isLoading,
                child: LinearProgressIndicator(),
              ),
              MaterialButton(
                onPressed: () {
                  ShowSnackBar(context,
                      content: "Please wait generating new set of SMSes");
                  Timer(Duration(seconds: 2), () {
                    RandomMessageMaster();
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Generate new SMSes",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                    "Generated " + messagesList.length.toString() + " smses"),
              ),
              height10,
              Expanded(
                child: ListView.builder(
                  itemCount: messageDictionary.length,
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var messageKey = messageDictionary.keys.toList()[index];
                    return messageTile(
                        key: messageKey,
                        dataMap: messageDictionary[messageKey]);
                  },
                ),
              ),
              SizedBox(
                height: 80,
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            buildXMLDocument();
          },
          backgroundColor: Colors.amber,
          label: Column(
            children: [
              Icon(
                Icons.download_outlined,
                color: Colors.black,
              ),
              Text(
                "XML",
                style: TextStyle(
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget messageTile({required var key, required var dataMap}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () {
          NavPush(context, MessageUI(addressKey: key, smsList: dataMap));
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(bankIcon[key]!),
              ),
              width10,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      key,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: sdp(context, 12),
                      ),
                    ),
                    height5,
                    Text(
                      dataMap[dataMap.length - 1]['_body'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              width10,
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.indigo.shade100,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: FittedBox(
                        child: Text(
                          dataMap.length.toString(),
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
