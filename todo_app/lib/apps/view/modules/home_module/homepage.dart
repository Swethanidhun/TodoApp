import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/apps/view/modules/add_module/addcontroller.dart';
import 'package:todo_app/apps/view/modules/add_module/addpage.dart';
import 'package:todo_app/apps/view/modules/edit_module/editpage.dart';
import 'package:todo_app/apps/view/widgets/appbar.dart';

class HomePage extends GetWidget<AddController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddController());
    final addcontroller = Get.find<AddController>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 158, 179, 235),
        onPressed: () {
          Get.to(() => const AddPage());
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: const AppBars(title: "TODO APP"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Obx(() => Expanded(
                    child: ListView.builder(
                  itemCount: addcontroller.dataList.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 200,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 150,
                                    child: addcontroller.dataList.isEmpty
                                        ? const SizedBox()
                                        : Text(
                                            addcontroller.dataList[index].title,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                color: Color.fromARGB(
                                                    255, 158, 179, 235)),
                                          ),
                                  ),
                                  SizedBox(
                                    width: 150,
                                    child: addcontroller.dataList.isEmpty
                                        ? const SizedBox()
                                        : Text(
                                            addcontroller
                                                .dataList[index].detail,
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                            maxLines: 5,
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                  )
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => const EditPage());
                                },
                                child: const Icon(
                                  Icons.edit,
                                  color: Color.fromARGB(255, 158, 179, 235),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  addcontroller.deleteData(index);
                                },
                                child: const Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 158, 179, 235),
                                ),
                              ),
                              Obx(() => GestureDetector(
                                  onTap: () {
                                    addcontroller.toggle();
                                  },
                                  child: Text(
                                    addcontroller.completed.value
                                        ? "completed"
                                        : "incompleted",
                                    style: TextStyle(
                                        color: addcontroller.completed.value
                                            ? Colors.green
                                            : Colors.red),
                                  ))),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )))
          ],
        ),
      ),
    );
  }
}
