import 'package:alimulla_task/core/utils/colors.dart';
import 'package:alimulla_task/features/home/presentation/pages/todo/todo.dart';
import 'package:alimulla_task/features/home/presentation/pages/todo/todo_viewmodel.dart';
import 'package:alimulla_task/main.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/button_widget.dart';
import '../../widgets/snackbar_widget.dart';
import '../../widgets/space_widget.dart';
import '../../widgets/text_field_widget.dart';
import '../../widgets/text_widget.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DemoRobotoTextWidget(text: "Add Task"),
        backgroundColor: kGoodPurple,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return ViewModelBuilder<TodoViewModel>.reactive(
        viewModelBuilder: () => TodoViewModel(),
        onModelReady: (model) {},
        builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFieldWidget(
                    placeholder: "Task Name",
                    textEditingController: model.taskNameTF),
                SpaceWidget(height: 20),
                TextFieldWidget(
                    placeholder: "Task Date",
                    textEditingController: model.taskDateTF,
                    textInputType: TextInputType.datetime),
                SpaceWidget(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton("Save", onPressed: () async {
                      if (model.taskNameTF.text.isNotEmpty &&
                          model.taskDateTF.text.isNotEmpty) {
                        await box!.put(
                            DateTime.now().toString(),
                            Books(
                                todo_date: model.taskDateTF.text,
                                todo_task_name: model.taskNameTF.text));
                        Navigator.pop(context);
                      } else {
                        SCSnackBar.show(context, "Required Field is empty");
                      }
                    }),
                    CustomButton("Clear", onPressed: () {
                      model.taskNameTF.clear();
                      model.taskDateTF.clear();
                    }),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
