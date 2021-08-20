import 'package:dkatalistest/features/external/dateutil.dart';
import 'package:flutter/material.dart';

import 'colorui.dart';
import 'component_ui.dart';

class ButtonApp extends StatefulWidget {
  final String text;
  final Function onTap;
  final bool enable;
  ButtonApp.disable(this.text, {required this.onTap, this.enable = false});
  ButtonApp.enable(this.text, {required this.onTap, this.enable = true});
  ButtonApp.dinamis(this.text, this.enable, {required this.onTap});

  @override
  _ButtonAppState createState() => _ButtonAppState();
}

class _ButtonAppState extends State<ButtonApp> {
  @override
  Widget build(BuildContext context) {
    return _setupbutton();
  }

  Widget _setupbutton() {
    Color _textColor;
    Color _btnColor;
    Color _borderColor;
    if (widget.enable) {
      _borderColor = ColorUI.colorEnableButton();
      _textColor = Colors.white;
      _btnColor = ColorUI.colorEnableButton();
    } else {
      _borderColor = ColorUI.colorDisableButton();
      _btnColor = ColorUI.colorDisableButton();
      _textColor = Colors.white;
    }
    return InkWell(
      onTap: () {
        if (widget.enable) {
          this.widget.onTap();
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 2),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          // alignment: Alignment.center,
          decoration: BoxDecoration(
            color: _btnColor,
            border: Border.all(color: _borderColor),
            borderRadius: BorderRadius.all(Radius.circular(8)),
            // boxShadow: <BoxShadow>[
            //   BoxShadow(
            //       color: Colors.blue,
            //       offset: Offset(2, 4),
            //       blurRadius: 5,
            //       spreadRadius: 2)
            // ],
          ),
          child: Center(
            child: Text(
              this.widget.text,
              style: TextStyle(
                  fontSize: 14, color: _textColor, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonMenu extends StatefulWidget {
  final Function onTap;
  final String text;
  final Image icon;
  final double iconSize;
  final bool enable;
  final Color iconColor;

  ButtonMenu(this.icon, this.text, this.onTap,
      {this.iconSize = 60, required this.iconColor, this.enable = true});

  @override
  _ButtonMenuState createState() => _ButtonMenuState();
}

class _ButtonMenuState extends State<ButtonMenu> {
  final TextStyle _labelStyle = const TextStyle(
      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.enable ? widget.onTap() : print('');
      },
      child: Column(
        children: [
          Container(
            height: widget.iconSize,
            width: widget.iconSize,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: widget.icon,
            ),
          ),
          Text(
            widget.text,
            style: _labelStyle,
          ),
        ],
      ),
    );
  }
}

class ButtonBack extends StatefulWidget {
  final String text;
  final Function onTap;

  ButtonBack(this.text, {required this.onTap});

  @override
  _ButtonBackState createState() => _ButtonBackState();
}

class _ButtonBackState extends State<ButtonBack> {
  @override
  Widget build(BuildContext context) {
    return _setupbutton();
  }

  Widget _setupbutton() {
    return InkWell(
      onTap: () {
        this.widget.onTap();
      },
      child: Container(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            Text(
              this.widget.text,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonShowDate extends StatelessWidget {
  final String label;
  final DateTime? dt;
  final double width;
  final Function onTap;
  ButtonShowDate(this.width, this.label, this.dt, {required this.onTap});

  @override
  Widget build(BuildContext context) {
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    if (!isIOS) {
      return _layout();
    } else {
      return _layoutiOS();
    }
  }

  Widget _layout() {
    String strDate = "";
    if (this.dt == null) {
      strDate = DateUtility.dateToStringPanjang(DateTime.now());
    } else {
      strDate = DateUtility.dateToStringPanjang(this.dt);
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              this.onTap();
            },
            child: Container(
              width: width,
              // padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
              // alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.all(color: Colors.blue),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ComponentUI.textGin("Date", Colors.grey, 14),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          strDate,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _layoutiOS() {
    String strDate = "";
    if (this.dt == null) {
      strDate = "- Chose Date -";
    } else {
      strDate = DateUtility.dateToStringPanjang(this.dt);
    }
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              this.onTap();
            },
            child: Container(
              width: width,
              // padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
              // alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.all(color: Colors.blue),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ComponentUI.textGin("Date", Colors.grey, 14),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          strDate,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonShowTime extends StatelessWidget {
  final String label;
  final DateTime? dt;
  final double width;
  final Function onTap;
  ButtonShowTime(this.width, this.label, this.dt, {required this.onTap});

  @override
  Widget build(BuildContext context) {
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    if (!isIOS) {
      return _layout();
    } else {
      return _layoutiOS();
    }
  }

  Widget _layout() {
    String strDate = "";
    if (this.dt == null) {
      strDate = DateUtility.dateToStringjammenit(DateTime.now());
    }
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              this.onTap();
            },
            child: Container(
              width: width,
              // padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
              // alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.all(color: Colors.blue),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ComponentUI.textGin("Date", Colors.grey, 14),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          strDate,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _layoutiOS() {
    String strDate = "";
    if (this.dt == null) {
      strDate = "- Chose Time -";
    } else {
      strDate = DateUtility.dateToStringjammenit(this.dt!);
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              this.onTap();
            },
            child: Container(
              width: width,
              // padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
              // alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.all(color: Colors.blue),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ComponentUI.textGin("Date", Colors.grey, 14),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          strDate,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
