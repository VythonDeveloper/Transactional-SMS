import 'package:flutter/material.dart';
import 'package:sms_bombing/utils/constant.dart';
import 'package:sms_bombing/utils/components.dart';
import 'package:sms_bombing/utils/sdp.dart';

class MessageUI extends StatefulWidget {
  final smsList;
  final addressKey;
  const MessageUI({required this.addressKey, required this.smsList, super.key});

  @override
  State<MessageUI> createState() =>
      _MessageUIState(smsList: smsList, addressKey: addressKey);
}

class _MessageUIState extends State<MessageUI> {
  final smsList;
  final addressKey;
  _MessageUIState({required this.addressKey, required this.smsList});

  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _controller.jumpTo(_controller.position.maxScrollExtent);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            ),
            width10,
            CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(bankIcon[addressKey]!),
            ),
            width10,
            Text(
              addressKey,
              style: TextStyle(fontSize: sdp(context, 15)),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView.builder(
            controller: _controller,
            shrinkWrap: true,
            itemCount: smsList.length,
            itemBuilder: ((context, index) {
              return textMessageTile(index);
            }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.animateTo(
            _controller.position.maxScrollExtent,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
          );
        },
        child: Icon(Icons.arrow_downward_sharp),
      ),
    );
  }

  Widget textMessageTile(int index) {
    return Container(
      alignment: Alignment.topLeft,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blueGrey.shade800,
              ),
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.8),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    smsList[index]['_body'],
                    style: TextStyle(fontSize: sdp(context, 13)),
                  ),
                ],
              ),
            ),
            height5,
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                smsList[index]['_readable_date'],
                style: TextStyle(color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }
}
