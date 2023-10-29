import 'package:aya_s_final_project/data/contact.dart';

class DataRepository {
  final List<Contact> dataList = [];

  void addData(Contact data) {
    dataList.add(data);
  }

  void editData(Contact newData, int index) {
    dataList[index] = newData;
  }

  void removeData(int index) {
    dataList.removeAt(index);
  }
}
