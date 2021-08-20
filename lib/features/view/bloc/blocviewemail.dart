import 'dart:async';

import 'package:dkatalistest/features/controller/login_controller.dart';

import 'uiitem/itememailview.dart';

class BlocViewEmail {
  ItemUiEmailView cacheItem = ItemUiEmailView("", false);
  LoginController loginController = LoginController();

  final _controlStateController = StreamController<ItemUiEmailView>.broadcast();

  StreamSink<ItemUiEmailView> get incomingVote => _controlStateController.sink;

  Stream<ItemUiEmailView> get outgoingVote => _controlStateController.stream;

  void firstime() {
    _controlStateController.sink.add(cacheItem);
  }

  textEditing(String str) {
    ItemUiEmailView local =
        ItemUiEmailView(str, loginController.checkEmail(str));

    if (local.isvalid != cacheItem.isvalid) {
      _controlStateController.sink.add(local);
    }
    cacheItem = local;
  }

  void dispose() {
    _controlStateController.close();
  }
}
