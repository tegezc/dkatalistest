import 'dart:async';

import 'package:dkatalistest/features/controller/login_controller.dart';
import 'package:dkatalistest/features/model/PasswordValidation.dart';
import 'package:dkatalistest/features/view/bloc/uiitem/itempasswordview.dart';

class BlocViewPassword {
  ItemUIPasswordView cacheItem =
      ItemUIPasswordView("", PasswordValidation.empty());
  LoginController loginController = LoginController();
  final _controlStateController =
      StreamController<ItemUIPasswordView>.broadcast();

  StreamSink<ItemUIPasswordView> get incomingVote =>
      _controlStateController.sink;

  Stream<ItemUIPasswordView> get outgoingVote => _controlStateController.stream;

  void firstime() {
    _controlStateController.sink.add(cacheItem);
  }

  textEditing(String str) {
    ItemUIPasswordView local = cacheItem;

    PasswordValidation passwordValidation = loginController.checkPassword(str);

    if (local.passwordValidation != passwordValidation) {
      _controlStateController.sink.add(local);
    }
    local.password = str;
    local.passwordValidation = passwordValidation;
  }

  void dispose() {
    _controlStateController.close();
  }
}
