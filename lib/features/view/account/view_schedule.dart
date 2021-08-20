import 'package:dkatalistest/features/view/component/colorui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../component/buttongin.dart';
import '../component/component_ui.dart';
import '../component/enumui.dart';

class ViewSchedule extends StatefulWidget {
  static const name = "/schedule";

  @override
  _ViewScheduleState createState() => _ViewScheduleState();
}

class _ViewScheduleState extends State<ViewSchedule>
    with TickerProviderStateMixin {
  DateTime? _currentDateTime;
  DateTime? _currentTime;

  AnimationController? _animationController;
  Animation? _animation;

  int _counter = 0;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationController!.repeat(reverse: true);
    _animation = Tween(begin: 2.0, end: 10.0).animate(_animationController!)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  void _eventButtonNext() {
    // Navigator.pushNamed(context, '/password');
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    if (_counter == 0) {
      if (!isIOS) {
        _currentDateTime = DateTime.now();
        _currentTime = DateTime.now();
      }
      _counter++;
    }
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          color: ColorUI.mainColor(),
          height: size.height - 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: ButtonBack('Create Account', onTap: () {
                  Navigator.pop(context);
                }),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 50),
                child:
                    ComponentUI.stepNewUser(EStepNewUser.schedul, size.width),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20),
                child: Container(
                  width: 60,
                  height: 60,
                  child: Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.blue,
                    size: 40,
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(100, 100, 25, 58),
                            blurRadius: _animation!.value,
                            spreadRadius: _animation!.value)
                      ]),
                ),
              ),
              Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24.0, top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        ComponentUI.textGinBold(
                            'Personal Information', Colors.white, 20.0),
                        SizedBox(height: 12.0),
                        ComponentUI.textGin(
                            'Please fill in the information bellow and your goal\n'
                            'for digital saving',
                            Colors.white,
                            16.0),
                        SizedBox(
                          height: 20,
                        ),
                        ButtonShowDate(
                          size.width - 80,
                          "Date",
                          _currentDateTime,
                          onTap: () {
                            _selectDatePicker();
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ButtonShowTime(
                          size.width - 80,
                          "Time",
                          _currentTime,
                          onTap: () {
                            _selectTime();
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )),
              Expanded(
                  child: Container(
                width: size.width,
              )),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: ButtonApp.enable("Next", onTap: () {
                  _eventButtonNext();
                }),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectDatePicker() {
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    if (!isIOS) {
      _datePickerAndroid();
    } else {
      _selectDateiOS();
    }
  }

  void _selectTime() {
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    if (!isIOS) {
      _selectTimeAndroid(context);
    } else {
      _selectTimeiOS();
    }
  }

  void _datePickerAndroid() async {
    DateTime dtawal = DateTime.now();
    DateTime dtakhir = DateTime(DateTime.now().year + 5);
    DateTime initialDt = DateTime.now();

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDt,
      firstDate: dtawal,
      lastDate: dtakhir,
    );

    if (picked != null) {}
  }

  Future<Null> _selectTimeAndroid(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {}
    setState(() {
      DateTime dt;
      if (_currentDateTime == null) {
        dt = _currentDateTime!;
      } else {
        dt = DateTime.now();
      }
      _currentTime =
          DateTime(dt.year, dt.month, dt.day, picked!.hour, picked.minute);
    });
  }

  _selectDateiOS() async {
    DateTime? pickedDate = await showModalBottomSheet<DateTime>(
      context: context,
      builder: (context) {
        DateTime tempPickedDate = _currentDateTime ?? DateTime.now();
        return Container(
          height: 250,
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CupertinoButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    CupertinoButton(
                      child: Text('Done'),
                      onPressed: () {
                        Navigator.of(context).pop(tempPickedDate);
                      },
                    ),
                  ],
                ),
              ),
              Divider(
                height: 0,
                thickness: 1,
              ),
              Expanded(
                child: Container(
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (DateTime dateTime) {
                      tempPickedDate = dateTime;
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

    if (pickedDate != null && pickedDate != _currentDateTime) {
      setState(() {
        _currentDateTime = pickedDate;
      });
    }
  }

  _selectTimeiOS() async {
    DateTime? pickedDate = await showModalBottomSheet<DateTime>(
      context: context,
      builder: (context) {
        DateTime tempPickedDate = _currentDateTime ?? DateTime.now();
        return Container(
          height: 250,
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CupertinoButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    CupertinoButton(
                      child: Text('Done'),
                      onPressed: () {
                        Navigator.of(context).pop(tempPickedDate);
                      },
                    ),
                  ],
                ),
              ),
              Divider(
                height: 0,
                thickness: 1,
              ),
              Expanded(
                child: Container(
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.time,
                    onDateTimeChanged: (DateTime dateTime) {
                      tempPickedDate = dateTime;
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        DateTime dt;
        if (_currentDateTime == null) {
          dt = _currentDateTime!;
        } else {
          dt = DateTime.now();
        }
        _currentTime = DateTime(
            dt.year, dt.month, dt.day, pickedDate.hour, pickedDate.minute);
      });
    }
  }
}
