import 'package:aya_s_final_project/presentation/form/form_validation_page.dart';
import 'package:aya_s_final_project/presentation/screens/contact_details.dart';
import 'package:aya_s_final_project/presentation/screens/edit_data_page.dart';
import 'package:aya_s_final_project/presentation/screens/intro.dart';
import 'package:aya_s_final_project/presentation/search/search_data.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, String>> dataList = [];
  List<Map<String, String>> filteredList = [];

  void _addData(Map<String, String> data) {
    setState(() {
      dataList.add(data);
    });
  }

  void editDataCallback(Map<String, String> newData, int index) {
    setState(() {
      dataList[index] = newData;
    });
  }

  void removeCallback(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Contact'),
        content: const Text('Are you sure you want to delete this contact?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Remove the contact from the list
              dataList.removeAt(index);
              setState(() {
                dataList.length = dataList.length;
                Navigator.pop(context);
              });

              // Pop the dialog.
              Navigator.pop(context);
              // Close the dialog
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  // void remove(int index) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: const Text('Delete contact'),
  //       content: const Text('Are you sure you want to delete this contact?'),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Navigator.pop(context),
  //           child: const Text('Cancel'),
  //         ),
  //         TextButton(
  //           onPressed: () {
  //             // Remove the item at the current index from the chats list.
  //             dataList.removeAt(index);

  //             // Update the itemCount property of the ListView.builder() widget.
  //             setState(() {
  //               dataList.length = dataList.length;
  //             });

  //             // Pop the dialog.
  //             Navigator.pop(context);
  //           },
  //           child: const Text('Delete'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  void remove(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Contact'),
        content: const Text('Are you sure you want to delete this contact?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Remove the contact from the list
              dataList.removeAt(index);
              Navigator.pop(context); // Close the dialog
              setState(() {}); // Refresh the list
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  void editData(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditDataPage(
          index: index,
          dataList: dataList,
          editData: (data, index) {
            setState(() {
              dataList[index] = data;
            });
          },
        ),
      ),
    );
  }

  // ignore: unused_element
  void _filterData(String query) {
    setState(() {
      if (query.isNotEmpty) {
        filteredList = dataList
            .where((data) =>
                data['name']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        filteredList = dataList;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    filteredList = dataList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contacts',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: DataSearchDelegate(
                    filteredList, editDataCallback, removeCallback),
              );
            },
          ),
        ],
      ),
      body: filteredList.isEmpty
          ? const IntroductionPage()
          : ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                final data = dataList[index];
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ContactDetailPage(
                              dataListe: data,
                              editDataCallback: (data, index) {
                                editDataCallback(data, index);
                              },
                              removeCallback: (index) {
                                removeCallback(index);
                              },
                              index: index,
                            ),
                          ));
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(dataList[index]['name']!.substring(0, 1)),
                      ),
                      title: Text(filteredList[index]['name']!),
                      subtitle: Text(filteredList[index]['mobileNumber']!),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              editData(index);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              remove(index);
                            },
                          ),
                        ],
                      ),
                    ));
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormValidationPage(addData: _addData),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
