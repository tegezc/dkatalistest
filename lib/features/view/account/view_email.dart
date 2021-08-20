import 'package:dkatalistest/features/view/bloc/blocviewemail.dart';
import 'package:dkatalistest/features/view/bloc/uiitem/itememailview.dart';
import 'package:dkatalistest/features/view/component/buttongin.dart';
import 'package:dkatalistest/features/view/component/colorui.dart';
import 'package:dkatalistest/features/view/component/component_ui.dart';
import 'package:dkatalistest/features/view/component/enumui.dart';
import 'package:flutter/material.dart';

import '../component/textfieldgin.dart';

class ViewEmail extends StatefulWidget {
  static const name = "/";

  @override
  _ViewEmailState createState() => _ViewEmailState();
}

class _ViewEmailState extends State<ViewEmail> {
  TextEditingController _textEditingController = TextEditingController();
  BlocViewEmail _blocViewEmail = BlocViewEmail();
  int _counterBuild = 0;

  void _eventButtonNext() {
    Navigator.pushNamed(context, '/password');
  }

  void _changetTextEmail() {
    String str = _textEditingController.text;
    _blocViewEmail.textEditing(str);
  }

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(_changetTextEmail);
  }

  @override
  void dispose() {
    _blocViewEmail.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_counterBuild == 0) {
      _blocViewEmail.firstime();
      _counterBuild++;
    }
    Size size = MediaQuery.of(context).size;
    return StreamBuilder<ItemUiEmailView>(
        stream: _blocViewEmail.outgoingVote,
        initialData: _blocViewEmail.cacheItem,
        builder:
            (BuildContext context, AsyncSnapshot<ItemUiEmailView> snapshot) {
          if (snapshot.hasData) {
            ItemUiEmailView? item = snapshot.data;
            if (item != null) {
              return Scaffold(
                body: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Container(
                    color: ColorUI.colorWhite(),
                    height: size.height - 80,
                    child: Column(
                      children: [
                        Container(
                          color: ColorUI.mainColor(),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 120.0, bottom: 40, left: 16, right: 16.0),
                            child: ComponentUI.stepNewUser(
                                EStepNewUser.email, size.width),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                            width: double.infinity,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 24.0, top: 40.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ComponentUI.richTechGinRegEmail(),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ComponentUI.textGinBold(
                                      'Welcome to The Bank of The Future.\n'
                                      'Manage and track your accounts on\nthe go.',
                                      Colors.black,
                                      14.0),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 12.0, top: 20),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: TextFieldRounded(
                                          _textEditingController,
                                        ),
                                      ),
                                    ),
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
                          child: ButtonApp.dinamis("Next", item.isvalid,
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
            } else {
              return Scaffold(body: Container());
            }
          } else {
            return Scaffold(body: Container());
          }
        });
  }
}
