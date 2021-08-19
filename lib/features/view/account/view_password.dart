import 'package:dkatalistest/features/model/enum/password_strength.dart';
import 'package:dkatalistest/features/view/account/view_personal_information.dart';
import 'package:dkatalistest/features/view/component/colorui.dart';
import 'package:flutter/material.dart';

import '../component/buttongin.dart';
import '../component/component_ui.dart';
import '../component/enumui.dart';
import '../component/textfieldgin.dart';

class ViewPassword extends StatefulWidget {
  static const name = "/password";
  @override
  _ViewPasswordState createState() => _ViewPasswordState();
}

class _ViewPasswordState extends State<ViewPassword> {
  TextEditingController _textEditingController = TextEditingController();

  void _eventButtonNext() {
    Navigator.pushNamed(context, ViewPersonalInformation.name);
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
                    ComponentUI.stepNewUser(EStepNewUser.password, size.width),
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
                            'Create Password', Colors.white, 20.0),
                        SizedBox(height: 12.0),
                        ComponentUI.textGin(
                            'Password will be used to login to account',
                            Colors.white,
                            16.0),
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0, top: 20),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: TextFieldPassword(
                              _textEditingController,
                              true,
                              hint: "Create password",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            ComponentUI.textGin("Complexity", Colors.white, 16),
                            ComponentUI.textGin(" : ", Colors.white, 16),
                            _textComplexity(EPasswordStrength.weak),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0, top: 20),
                          child: _validationPassword(size.width),
                        ),
                        SizedBox(
                          height: 60,
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

  Widget _textComplexity(EPasswordStrength ePasswordStrength) {
    double fontsize = 16;
    Color color = Colors.transparent;
    String label = "";
    switch (ePasswordStrength) {
      case EPasswordStrength.kosong:
        color = Colors.transparent;
        label = "";
        break;
      case EPasswordStrength.weak:
        color = ColorUI.colorWeakPassword();
        label = "Very Weak";
        break;
      case EPasswordStrength.fairstrong:
        color = ColorUI.colorFairPassword();
        label = "Fair Strong";
        break;
      case EPasswordStrength.strong:
        color = ColorUI.colorStrongPassword();
        label = "Strong";
        break;
    }
    return ComponentUI.textGinBold(label, color, fontsize);
  }

  Widget _validationPassword(double width) {
    return Container(
      width: width,
      color: Colors.transparent,
      child: Row(
        children: [
          _descValidation("a", "Lowercase"),
          Expanded(
            child: Container(),
          ),
          _descValidation("A", "Uppercase"),
          Expanded(
            child: Container(),
          ),
          _descValidation("123", "Number"),
          Expanded(
            child: Container(),
          ),
          _descValidationPass("Characters"),
        ],
      ),
    );
  }

  Widget _descValidation(String label1, String label2) {
    return Column(
      children: [
        ComponentUI.textGinBold(label1, Colors.white, 30),
        SizedBox(
          height: 8,
        ),
        ComponentUI.textGin(label2, Colors.white, 14)
      ],
    );
  }

  Widget _descValidationPass(String label2) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(25))),
          child: Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 35,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        ComponentUI.textGin(label2, Colors.white, 14)
      ],
    );
  }
}
