import 'package:alimulla_task/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../main.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/text_widget.dart';
import 'model/todo.dart';
import 'demo_add_task.dart';

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
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddTaskPage()),
            );
          },
          backgroundColor: kGoodPurple,
          child: const Icon(Icons.add)),
    );
  }

  Widget _body() {
    return ValueListenableBuilder(
        valueListenable: Hive.box<Books>('tododata').listenable(),
        builder: (context, Box<Books> box, _) {
          return box.values.isEmpty
              ? Center(
                  child: DemoRobotoTextWidget(
                    text: "No Todos",
                  ),
                )
              : ListView.builder(
                  itemCount: box.values.length,
                  itemBuilder: (BuildContext context, int index) {
                    var result = box.getAt(index);
                    return Dismissible(
                      key: Key("as"),
                      background: Container(color: Colors.red),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        box.deleteAt(index);
                      },
                      child: Container(
                        child: ListTile(
                          leading: DemoRobotoTextWidget(
                              text: "${result?.todo_task_name}", fontSize: 25),
                          trailing: DemoRobotoMonoTextWidget(
                              text: "${result?.todo_date}",fontSize: 18),
                        ),
                        decoration: myBoxDecoration(),
                      ),
                    );
                  },
                );
        });
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
