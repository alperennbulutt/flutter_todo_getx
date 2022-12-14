import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/models/todo.dart';
import 'package:todo_getx/controllers/todo_controller.dart';

class TodoScreen extends StatelessWidget {
  static const id = '/Todo_Screen';
  final TodoController todoController = Get.find<TodoController>();

  final TextEditingController textEditingController = TextEditingController();

  TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                // textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: "What do you want to accomplish?",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                style: const TextStyle(
                  fontSize: 25.0,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                autofocus: true,
                controller: textEditingController,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    textStyle: const TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    textStyle: const TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    todoController.todos.add(
                      Todo(
                        text: textEditingController.text,
                      ),
                    );
                    Get.back();
                  },
                  child: const Text('Add'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
