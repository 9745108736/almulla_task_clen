import 'package:alimulla_task/core/utils/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/button_widget.dart';
import '../widgets/text_widget.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: Key("as"),
          background: Container(color: Colors.red),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            // setState(() {
            //   items.removeAt(index);
            // });
            // Scaffold.of(context)
            //     .showSnackBar(SnackBar(content: Text("$item dismissed")));
          },
          child: Container(
            child: ListTile(
              leading:
                  DemoRobotoTextWidget(text: "Pay Internet bill", fontSize: 15),
              trailing: DemoRobotoMonoTextWidget(text: "12/10/2022 12:12 PM"),
            ),
            decoration: myBoxDecoration(),
          ),
        );
      },
    );
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border(
        top: BorderSide(
          //                    <--- top side
          color: kGoodDarkGray,
          width: 1.0,
        ),
      ),
    );
  }
}
