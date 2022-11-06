import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:encrypt/encrypt.dart';

import 'encrypt_data.dart';

class EncryptViewModel extends BaseViewModel implements EncryptData {
  TextEditingController messageTf = TextEditingController();
  TextEditingController secreteKeyTF = TextEditingController();


  String getmessage() => messageTf.text;

  String getsecreteKey() => messageTf.text;
  EncryptData _data = EncryptData();

  @override
  String? decryptAES({plainText, encryptionKey}) {
    String? _res =
        _data.decryptAES(encryptionKey: encryptionKey, plainText: plainText);
    return _res;
  }

  @override
  String? encryptAES({plainText, encryptionKey}) {
    String? _res =
        _data.encryptAES(encryptionKey: encryptionKey, plainText: plainText);
    return _res;
  }
}
