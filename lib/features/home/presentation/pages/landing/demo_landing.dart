import 'package:flutter/material.dart';

import '../../widgets/sign_in_with_button.dart';
import '../../widgets/text_widget.dart';

class DemoLandingPage extends StatefulWidget {
  const DemoLandingPage({Key? key}) : super(key: key);

  @override
  _DemoLandingPageState createState() => _DemoLandingPageState();
}

class _DemoLandingPageState extends State<DemoLandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(),
          DemoBoldTextWidget(text: "DEMO", fontSize: 30),
          GoogleSignInButton(),
        ],
      ),
    );
  }
}
