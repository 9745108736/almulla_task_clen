import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/button_widget.dart';
import '../../widgets/snackbar_widget.dart';
import '../../widgets/space_widget.dart';
import '../../widgets/text_field_widget.dart';
import '../../widgets/text_widget.dart';
import 'encrypt_viewmodel.dart';

class DemoEncryptPage extends StatefulWidget {
  const DemoEncryptPage({Key? key}) : super(key: key);

  @override
  State<DemoEncryptPage> createState() => _DemoEncryptPageState();
}

class _DemoEncryptPageState extends State<DemoEncryptPage> {
  String? encryptORDecryptString;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return ViewModelBuilder<EncryptViewModel>.reactive(
        viewModelBuilder: () => EncryptViewModel(),
        onModelReady: (model) {
          model.secreteKeyTF.text = "This 32 char key have 256 bits..";
        },
        builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFieldWidget(
                    placeholder: "Message",
                    minLine: 7,
                    textEditingController: model.messageTf),
                SpaceWidget(height: 30),
                TextFieldWidget(
                    placeholder: "Secrete Key",
                    textEditingController: model.secreteKeyTF,
                    enableParam: true),
                SpaceWidget(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton("Encrypt", onPressed: () {
                      if (model.secreteKeyTF.text.length != 32) {
                        SCSnackBar.show(
                            context, "Secrete key should be 32 character");
                      } else if (model.messageTf.text.isNotEmpty) {
                        String? _key = model.encryptAES(
                            plainText: model.messageTf.text,
                            encryptionKey: model.secreteKeyTF.text);
                        if (_key != null) {
                          // model.messageTf.text = _key!;
                          encryptORDecryptString = (_key);
                          setState(() {});
                        }
                      } else {
                        SCSnackBar.show(context, "Message should not be empty");
                      }
                    }),
                    CustomButton("Decrypt", onPressed: () {
                      if (model.secreteKeyTF.text.isEmpty) {
                        SCSnackBar.show(
                            context, "Secrete key should be 32 character");
                      } else {
                        String? _message = model.decryptAES(
                            plainText: model.getmessage(),
                            encryptionKey: model.secreteKeyTF.text);
                        if (_message != null) {
                          encryptORDecryptString = (_message);
                          setState(() {});
                        }
                      }
                    }),
                  ],
                ),
                SpaceWidget(height: 20),
                Wrap(
                  children: [
                    DemoRobotoTextWidget(
                      text: encryptORDecryptString ??
                          "Encrypted / Decrypted String",
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
