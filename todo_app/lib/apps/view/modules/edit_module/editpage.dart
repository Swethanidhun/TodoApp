import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/apps/view/modules/add_module/addcontroller.dart';
import 'package:todo_app/apps/view/widgets/appbar.dart';
import 'package:todo_app/apps/view/widgets/button.dart';

class EditPage extends GetWidget<AddController> {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddController());
    final addcontroller = Get.find<AddController>();
    return Scaffold(
      appBar: const AppBars(
        title: "EDIT",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: "Title"),
              controller: addcontroller.addtitlecontroller,
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "Detail"),
              controller: addcontroller.adddetailcontroller,
            ),
            const SizedBox(
              height: 30,
            ),
            Button(
                title: "Edit",
                onPressed: () {
                  controller.updateData();
                },
                width: 300)
          ],
        ),
      ),
    );
  }
}
