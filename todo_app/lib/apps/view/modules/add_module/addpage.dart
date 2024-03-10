import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/apps/view/modules/add_module/addcontroller.dart';
import 'package:todo_app/apps/view/widgets/appbar.dart';
import 'package:todo_app/apps/view/widgets/button.dart';

class AddPage extends GetWidget<AddController> {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddController());
    final addcontroller = Get.find<AddController>();
    return Scaffold(
      appBar: const AppBars(title: "ADD"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: "Title"),
              controller: addcontroller.titlecontroller,
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "Detail"),
              controller: addcontroller.detailcontroller,
            ),
            const SizedBox(
              height: 30,
            ),
            Button(
                title: "Add",
                onPressed: () {
                  controller.saveData();
                },
                width: 300)
          ],
        ),
      ),
    );
  }
}
