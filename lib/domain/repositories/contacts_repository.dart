// contacts_repository.dart

import 'package:aya_s_final_project/domain/entities/contact.dart';


class ContactsRepository {
  List<Contact> dataList = [];

  void addContact(Contact contact) {
    dataList.add(contact);
  }

  void editContact(int index, Contact newContact) {
    dataList[index] = newContact;
  }

  void removeContact(int index) {
    dataList.removeAt(index);
  }
}
