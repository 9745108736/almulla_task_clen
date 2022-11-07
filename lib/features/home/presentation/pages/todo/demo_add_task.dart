import 'package:alimulla_task/core/utils/colors.dart';
import 'package:alimulla_task/features/home/presentation/pages/todo/model/todo.dart';
import 'package:alimulla_task/features/home/presentation/pages/todo/model/todo_viewmodel.dart';
import 'package:alimulla_task/main.dart';
import 'package:date_time_picker/date_time_picker.dart';
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
        onModelReady: (model) {
        model.defualtDateTime();
        },
        builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFieldWidget(
                    placeholder: "Task Name",
                    textEditingController: model.taskNameTF),
                SpaceWidget(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(
                            15.0) //                 <--- border radius here
                        ),
                  ),
                  child: DateTimePicker(
                    type: DateTimePickerType.dateTimeSeparate,
                    dateMask: 'd MMM, yyyy',
                    initialValue: DateTime.now().toString(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    icon: Icon(Icons.event),
                    dateLabelText: 'Date',
                    timeLabelText: "Hour",
                    selectableDayPredicate: (date) {
                      // Disable weekend days to select from the calendar
                      if (date.weekday == 6 || date.weekday == 7) {
                        return false;
                      }
                      return true;
                    },
                    onChanged: (val) {
                      model.selectedDateTime = val;
                      print(
                          "model.selectedDateTime - ${model.selectedDateTime}");
                    },
                    validator: (val) {
                      print(val);
                      return null;
                    },
                    onSaved: (val) {
                      model.selectedDateTime = val;
                      print(
                          "model.selectedDateTime - ${model.selectedDateTime}");
                    },
                  ),
                ),
                SpaceWidget(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton("Save", onPressed: () async {
                      print("asdjlksjf - ${model.selectedDateTime}");
                      if (model.taskNameTF.text.isNotEmpty &&
                          model.selectedDateTime != "") {
                        await box!.put(
                            DateTime.now().toString(),
                            Books(
                                todo_date: model.selectedDateTime,
                                todo_task_name: model.taskNameTF.text));
                        Navigator.pop(context);
                      } else {
                        SCSnackBar.show(context, "Please enter a task");
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
