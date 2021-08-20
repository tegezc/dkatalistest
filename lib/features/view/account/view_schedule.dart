import 'package:dkatalistest/features/view/component/colorui.dart';
import 'package:flutter/material.dart';

import '../component/buttongin.dart';
import '../component/component_ui.dart';
import '../component/enumui.dart';

class ViewSchedule extends StatefulWidget {
  static const name = "/schedule";

  @override
  _ViewScheduleState createState() => _ViewScheduleState();
}

class _ViewScheduleState extends State<ViewSchedule> {
  void _eventButtonNext() {
    // Navigator.pushNamed(context, '/password');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          color: ColorUI.mainColor(),
          height: size.height - 80,
          child: Column(
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
              SizedBox(
                height: 40,
              ),
              Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24.0, top: 40.0),
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
                          DateTime.now(),
                          onTap: () {
                            _datePicker();
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ButtonShowTime(
                          size.width - 80,
                          "Time",
                          DateTime.now(),
                          onTap: () {
                            _selectTime(context);
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

  void _datePicker() async {
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

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {}
    // setState(() {
    //   selectedTime = picked;
    //   _hour = selectedTime.hour.toString();
    //   _minute = selectedTime.minute.toString();
    //   _time = _hour + ' : ' + _minute;
    //   _timeController.text = _time;
    //   _timeController.text = formatDate(
    //       DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
    //       [hh, ':', nn, " ", am]).toString();
    // });
  }
}
