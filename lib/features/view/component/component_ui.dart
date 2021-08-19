import 'package:dkatalistest/features/view/component/enumui.dart';
import 'package:flutter/material.dart';


class ComponentUI {
  static Widget circleNumber(String number, bool ispass) {
    return Container(
      child: CircleAvatar(
        backgroundColor: ispass ? Colors.green : Colors.white,
        minRadius: 30.0,
        maxRadius: 35.0,
        child: Text(
          number,
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        border: new Border.all(
          color: Colors.black,
          width: 2.0,
        ),
      ),
    );
  }

  static Widget stepNewUser(EStepNewUser eStepNewUser, double width) {
    List<bool> linesactive = [false, false, false, false];
    switch (eStepNewUser) {
      case EStepNewUser.email:
        linesactive = [false, false, false, false];
        break;
      case EStepNewUser.password:
        linesactive = [true, false, false, false];
        break;
      case EStepNewUser.personal:
        linesactive = [true, true, false, false];
        break;
      case EStepNewUser.schedul:
        linesactive = [true, true, true, false];
        break;
    }
    Widget line = Expanded(
        child: Divider(
      height: 5,
      thickness: 3.0,
      color: Colors.black,
    ));
    return Container(
      width: width,
      color: Colors.transparent,
      child: Row(
        children: [
          ComponentUI.circleNumber("1", linesactive[0]),
          line,
          ComponentUI.circleNumber("2", linesactive[1]),
          line,
          ComponentUI.circleNumber("3", linesactive[2]),
          line,
          ComponentUI.circleNumber("4", linesactive[3]),
        ],
      ),
    );
  }

  static Widget textGin(String label, Color color, double size) {
    TextStyle textStyle = TextStyle(
      color: color,
      fontSize: size,
    );
    return Text(
      label,
      style: textStyle,
    );
  }

  static Widget textGinBold(String label, Color color, double size) {
    TextStyle textStyle =
        TextStyle(color: color, fontSize: size, fontWeight: FontWeight.bold);
    return Text(
      label,
      style: textStyle,
    );
  }

  static Widget richTechGinRegEmail() {
    return RichText(
      text: TextSpan(
        text: 'Welcom to \n',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
        children: const <TextSpan>[
          TextSpan(
            text: 'Gin',
          ),
          TextSpan(
              text: ' Finans',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(101, 151, 238, 1))),
        ],
      ),
    );
  }
}
