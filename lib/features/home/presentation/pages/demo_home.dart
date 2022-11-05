import 'package:flutter/material.dart';

import '../widgets/button_widget.dart';
import '../widgets/space_widget.dart';
import '../widgets/text_field_widget.dart';
import '../widgets/text_widget.dart';

class DemoHomePage extends StatefulWidget {
  const DemoHomePage({Key? key}) : super(key: key);

  @override
  State<DemoHomePage> createState() => _DemoHomePageState();
}

class _DemoHomePageState extends State<DemoHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextFieldWidget(placeholder: "Message", minLine: 7),
          SpaceWidget(height: 30),
          TextFieldWidget(
            placeholder: "Secrete Key",
          ),
          SpaceWidget(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton("Encrypt"),
              CustomButton("Encrypt"),
            ],
          ),
          SpaceWidget(height: 20),
          Row(
            children: [
              DemoRobotoTextWidget(text: "Encrypted / Decrypted String"),
            ],
          ),
        ],
      ),
    );
  }
}
