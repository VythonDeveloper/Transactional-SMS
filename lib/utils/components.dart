import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'sdp.dart';

systemColors() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
      overlays: [SystemUiOverlay.top]);

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.grey.shade900,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
}

TextStyle kTitleStyle(
  BuildContext context, {
  Color? color,
  FontWeight? fontWeight,
  double? fontSize,
}) {
  return TextStyle(
    color: color ?? Colors.white,
    fontSize: fontSize ?? sdp(context, 15),
    fontWeight: fontWeight ?? FontWeight.w500,
  );
}

TextStyle kSubtitleStyle(
  BuildContext context, {
  Color? color,
  FontWeight? fontWeight,
  double? textSize,
}) {
  return TextStyle(
    color: color ?? Colors.white,
    fontSize: sdp(context, textSize ?? 10),
    fontWeight: fontWeight ?? FontWeight.w500,
    letterSpacing: 2,
  );
}

get height5 => SizedBox(height: 5);
get height10 => SizedBox(height: 10);
get height20 => SizedBox(height: 20);
get width5 => SizedBox(width: 5);
get width10 => SizedBox(width: 10);
get width20 => SizedBox(width: 20);

// ignore: non_constant_identifier_names
NavPush(BuildContext context, screen) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => screen));
}

// ignore: non_constant_identifier_names
NavPushReplacement(BuildContext context, screen) {
  return Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => screen));
}

NavPopUntilPush(BuildContext context, screen) {
  Navigator.popUntil(context, (route) => false);
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => screen));
}

void showLoading(BuildContext context) {
  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Container(
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    ),
  );

  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

void ShowSnackBar(BuildContext context,
    {required String content, bool? isDanger = false}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: isDanger! ? Colors.red : Colors.green,
      dismissDirection: DismissDirection.vertical,
      // behavior: SnackBarBehavior.floating,
      // shape: StadiumBorder(),
      content: Text(
        content,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white,
          fontFamily: 'Nunito',
        ),
      ),
    ),
  );
}
