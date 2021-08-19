import 'package:dkatalistest/features/dummydata.dart';
import 'package:dkatalistest/features/model/expense.dart';
import 'package:dkatalistest/features/model/goal_activation.dart';
import 'package:dkatalistest/features/model/income.dart';
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
  GoalActivation? _currentGoalActivation;
  Expense? _currentExpense;
  Income? _currentIncome;

  List<GoalActivation> _lgoal = Dummy.dummyGoalActivation();
  List<Expense> _lexpense = Dummy.dummyExpense();
  List<Income> _linocme = Dummy.dummyIncome();

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
                    ComponentUI.stepNewUser(EStepNewUser.personal, size.width),
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
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0, top: 20),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: _comboboxGoal(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0, top: 20),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: _comboboxIncome(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0, top: 20),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: _comboboxExpense(),
                          ),
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

  Widget _comboboxGoal() {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  ComponentUI.textGin("Goal for activation", Colors.grey, 14),
            ),
          ),
          DropdownButton(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            items: _lgoal
                .map((value) => DropdownMenuItem<GoalActivation>(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ComponentUI.textGinBold(
                            "${value.text}", Colors.black, 18),
                      ),
                      value: value,
                    ))
                .toList(),
            onChanged: (item) {
              setState(() {
                _currentGoalActivation = item as GoalActivation;
              });
            },
            value: _currentGoalActivation,
            isExpanded: true,
            hint: Padding(
              padding: const EdgeInsets.all(4.0),
              child:
                  ComponentUI.textGinBold("- Chose Option -", Colors.black, 18),
            ),
          )
        ],
      ),
    );
  }

  Widget _comboboxIncome() {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ComponentUI.textGin("Monthly Income", Colors.grey, 14),
            ),
          ),
          DropdownButton(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            items: _linocme
                .map((value) => DropdownMenuItem<Income>(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ComponentUI.textGinBold(
                            "${value.income}", Colors.black, 18),
                      ),
                      value: value,
                    ))
                .toList(),
            onChanged: (item) {
              setState(() {
                _currentIncome = item as Income;
              });
            },
            value: _currentIncome,
            isExpanded: true,
            hint: Padding(
              padding: const EdgeInsets.all(4.0),
              child:
                  ComponentUI.textGinBold("- Chose Option -", Colors.black, 18),
            ),
          )
        ],
      ),
    );
  }

  Widget _comboboxExpense() {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ComponentUI.textGin("Monthly Expense", Colors.grey, 14),
            ),
          ),
          DropdownButton(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            items: _lexpense
                .map((value) => DropdownMenuItem<Expense>(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ComponentUI.textGinBold(
                            "${value.expense}", Colors.black, 18),
                      ),
                      value: value,
                    ))
                .toList(),
            onChanged: (item) {
              setState(() {
                _currentExpense = item as Expense;
              });
            },
            value: _currentExpense,
            isExpanded: true,
            hint: Padding(
              padding: const EdgeInsets.all(4.0),
              child:
                  ComponentUI.textGinBold("- Chose Option -", Colors.black, 18),
            ),
          )
        ],
      ),
    );
  }
}
