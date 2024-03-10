import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/apps/view/modules/home_module/homepage.dart';

class DataModel {
  final String title;
  final String detail;

  DataModel({required this.title, required this.detail});
}

class AddController extends GetxController {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController detailcontroller = TextEditingController();
  TextEditingController addtitlecontroller = TextEditingController();
  TextEditingController adddetailcontroller = TextEditingController();
  RxList<DataModel> dataList = <DataModel>[].obs;

  void saveData() async {
    var myBox = await Hive.openBox('myBox');
    await myBox.put('title', titlecontroller.text);
    await myBox.put('detail', detailcontroller.text);
    dataList.add(DataModel(
      title: titlecontroller.text,
      detail: detailcontroller.text,
    ));
    titlecontroller.clear();
    detailcontroller.clear();
    Get.to(() => const HomePage());
  }

  Future<void> fetchData() async {
    var myBox = await Hive.openBox('myBox');
    String? title = myBox.get('title');
    String? detail = myBox.get('detail');
    if (title != null && detail != null) {
      addtitlecontroller.text = title;
      adddetailcontroller.text = detail;
      dataList.add(DataModel(title: title, detail: detail));
    }
  }

  void updateData() async {
    var myBox = await Hive.openBox('myBox');
    await myBox.put('title', addtitlecontroller.text);
    await myBox.put('detail', adddetailcontroller.text);
    dataList.add(DataModel(
      title: addtitlecontroller.text,
      detail: adddetailcontroller.text,
    ));
    Get.to(() => const HomePage());
  }

  @override
  void onReady() {
    super.onReady();
    fetchData();
  }

  RxBool completed = false.obs;

  void toggle() {
    completed.value = !completed.value;
  }

  void deleteData(int index) async {
  var myBox = await Hive.openBox('myBox');
  
  await myBox.deleteAt(index);
  
  dataList.removeAt(index);
}


  @override
  void dispose() {
    titlecontroller.dispose();
    detailcontroller.dispose();
    super.dispose();
  }
}
