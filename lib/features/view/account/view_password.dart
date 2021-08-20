import 'package:dkatalistest/features/model/PasswordValidation.dart';
import 'package:dkatalistest/features/model/enum/password_strength.dart';
import 'package:dkatalistest/features/view/account/view_personal_information.dart';
import 'package:dkatalistest/features/view/bloc/blocviewpassword.dart';
import 'package:dkatalistest/features/view/bloc/uiitem/itempasswordview.dart';
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
  BlocViewPassword _blocViewPassword = BlocViewPassword();
  int _counter = 0;
  void _eventButtonNext() {
    Navigator.pushNamed(context, ViewPersonalInformation.name);
  }

  _textEditing() {
    _blocViewPassword.textEditing(_textEditingController.text);
  }

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(_textEditing);
  }

  @override
  void dispose() {
    _blocViewPassword.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_counter == 0) {
      _counter++;
      _blocViewPassword.firstime();
    }
    Size size = MediaQuery.of(context).size;
    return StreamBuilder<ItemUIPasswordView>(
      stream: _blocViewPassword.outgoingVote,
      initialData: _blocViewPassword.cacheItem,
      builder:
          (BuildContext context, AsyncSnapshot<ItemUIPasswordView> snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(body: Container());
        } else {
          ItemUIPasswordView? item = snapshot.data;
          if (item == null) {
            item = _blocViewPassword.cacheItem;
          }
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
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 50),
                      child: ComponentUI.stepNewUser(
                          EStepNewUser.password, size.width),
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
                                padding:
                                    const EdgeInsets.only(right: 12.0, top: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: TextFieldPassword(
                                    _textEditingController,
                                    true,
                                    hint: "Create password",
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 4),
                                child: ComponentUI.textGinBold(
                                    'minimal 8 character', Colors.red, 14.0),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  ComponentUI.textGin(
                                      "Complexity", Colors.white, 16),
                                  ComponentUI.textGin(" : ", Colors.white, 16),
                                  _textComplexity(
                                      item.passwordValidation.strengthPassword),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 16.0, top: 20),
                                child: _validationPassword(
                                    item.passwordValidation, size.width),
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
                      child: ButtonApp.dinamis(
                          "Next", item.passwordValidation.ispasswordValid(),
                          onTap: () {
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
      },
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

  Widget _validationPassword(
      PasswordValidation passwordValidation, double width) {
    return Container(
      width: width,
      color: Colors.transparent,
      child: Row(
        children: [
          passwordValidation.hasLowercase
              ? _descValidationPass("Lowercase")
              : _descValidation("a", "Lowercase"),
          Expanded(
            child: Container(),
          ),
          passwordValidation.hasUpercase
              ? _descValidationPass("Uppercase")
              : _descValidation("A", "Uppercase"),
          Expanded(
            child: Container(),
          ),
          passwordValidation.hasNumber
              ? _descValidationPass("Number")
              : _descValidation("123", "Number"),
          Expanded(
            child: Container(),
          ),
          passwordValidation.hasChar
              ? _descValidationPass("Characters")
              : _descValidation("9+", "Characters"),
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
