import 'package:flutter/material.dart';
import 'package:delivery_app_tech_test/repository/account/account_info.dart';

class AccountProvider extends ChangeNotifier {
  AccountInfo? _account;

  void rebuildAccountInfo() {
    notifyListeners();
  }

  void updateAccount(AccountInfo newAccount) {
    _account = newAccount;
  }

  AccountInfo? get accountInfo => _account;
}
